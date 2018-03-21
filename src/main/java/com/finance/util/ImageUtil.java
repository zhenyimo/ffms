package com.finance.util;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageTypeSpecifier;
import javax.imageio.metadata.IIOMetadata;
import javax.imageio.plugins.jpeg.JPEGImageWriteParam;
import javax.imageio.stream.ImageOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.twelvemonkeys.imageio.plugins.jpeg.JPEGImageWriter;




/**
 * The Class ImageUtil.
 */
public class ImageUtil {

  /** The Constant logger. */
  private static final Logger logger = LoggerFactory.getLogger(ImageUtil.class);

  /** The proportion. */
  private static boolean proportion = true; // 是否等比缩放标记(默认为等比缩放)

  /**
   * Compress pic.
   * 
   * @param inputFile the input file
   * @param outputFile the output file
   * @param outputWidth the output width
   * @param outputHeight the output height
   * @return true, if successful
   */
  public static boolean compressPic(File inputFile, String outputFile, int outputWidth,
      int outputHeight) {
    FileOutputStream out = null;
    try {
      // 获得源文件
      if (!inputFile.exists()) {
        return false;
      }
      String srcFileName = inputFile.getAbsolutePath();
      if (srcFileName.toLowerCase().trim().endsWith("tif")) { // 源文件名称后缀为“tif”
        inputFile = turnToJPG(srcFileName);
        outputFile = outputFile.substring(0, outputFile.length() - 7) + "jpg.min";
      }
      Image img = ImageIO.read(inputFile);
      // 判断图片格式是否正确
      if (img == null || img.getWidth(null) == -1) {
        return false;
      } else {
        int newWidth;
        int newHeight;
        // 判断是否是等比缩放
        if (proportion == true) {
          // 为等比缩放计算输出的图片宽度及高度
          double rate1 = ((double) img.getWidth(null)) / (double) outputWidth + 0.1;
          double rate2 = ((double) img.getHeight(null)) / (double) outputHeight + 0.1;
          // 根据缩放比率大的进行缩放控制
          double rate = rate1 > rate2 ? rate1 : rate2;
          newWidth = (int) (img.getWidth(null) / rate);
          newHeight = (int) (img.getHeight(null) / rate);
        } else {
          newWidth = outputWidth; // 输出的图片宽度
          newHeight = outputHeight; // 输出的图片高度
        }
        BufferedImage tag = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
        tag.getGraphics().drawImage(
            img.getScaledInstance(newWidth, newHeight, Image.SCALE_AREA_AVERAGING), 0, 0, null);
        out = new FileOutputStream(outputFile);
        int dpi = 300;// 分辨率
        float jpegCompression = 0.7f; // 压缩质量 百分比
        saveAsJpeg(dpi, tag, jpegCompression, out);
        out.close();
      }
    } catch (Exception ex) {
      logger.error("compressPic error", ex);
      return false;
    } finally {
      if (out != null) {
        try {
          out.close();
        } catch (Exception e) {
        }
      }
    }
    return true;
  }

  /**
   * 以JPEG编码保存图片
   * 
   * @param dpi 分辨率
   * @param image_to_save 要处理的图像图片
   * @param JPEGcompression 压缩比
   * @param fos 文件输出流
   * @throws IOException
   */
  public static void saveAsJpeg(Integer dpi, BufferedImage image_to_save, float JPEGcompression,
      FileOutputStream fos) throws IOException {
    JPEGImageWriter imageWriter = (JPEGImageWriter) ImageIO.getImageWritersBySuffix("jpg").next();
    ImageOutputStream ios = ImageIO.createImageOutputStream(fos);
    imageWriter.setOutput(ios);
    IIOMetadata imageMetaData =
        imageWriter.getDefaultImageMetadata(new ImageTypeSpecifier(image_to_save), null);

    if (JPEGcompression >= 0 && JPEGcompression <= 1f) {
      JPEGImageWriteParam jpegParams = (JPEGImageWriteParam) imageWriter.getDefaultWriteParam();
      jpegParams.setCompressionMode(JPEGImageWriteParam.MODE_EXPLICIT);
      jpegParams.setCompressionQuality(JPEGcompression);

    }

    imageWriter.write(imageMetaData, new IIOImage(image_to_save, null, null), null);
    ios.close();
    imageWriter.dispose();

  }

  /**
   * 将tif格式图片转换成jpg格式.
   * 
   * @param srcFileName 源文件名称
   * @return 返回转换后的图片
   */
  public static File turnToJPG(String srcFileName) {
    if (srcFileName != null && !"".equals(srcFileName)) {
      FileOutputStream fos = null;
      try {
        // RenderedOp source = JAI.create("fileload", srcFileName);
        // fos =
        // new FileOutputStream(srcFileName.substring(0, srcFileName.lastIndexOf(".") + 1) + "jpg");
        // JPEGEncodeParam JPEGparam = new JPEGEncodeParam();
        // ImageEncoder encoder = ImageCodec.createImageEncoder("jpeg", fos, JPEGparam);
        // encoder.encode(source);
        // String output = srcFileName.substring(0, srcFileName.lastIndexOf(".") + 1) + "jpg";
        // fos.close();
        // return new File(output);
        // TODO use new api to convert ,not use sun api
        return new File(srcFileName);
      } catch (Exception e) {
        logger.error("turnToJPG error!", e);
      } finally {
        if (fos != null) {
          try {
            fos.close();
          } catch (Exception e) {
          }
        }
      }
    }
    return null;
  }

  /**
   * 将png格式图片转换成jpg格式.
   * 
   * @param srcFileName 源文件名称
   * @return 返回转换后的图片
   */
  public static File pngTurnToJPG(String srcFileName) {
    try {
      BufferedImage bufferedImage = ImageIO.read(new File(srcFileName));
      BufferedImage newBufferedImage =
          new BufferedImage(bufferedImage.getWidth(), bufferedImage.getHeight(),
              BufferedImage.TYPE_INT_RGB);
      newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
      ImageIO.write(newBufferedImage, "jpg",
          new File(srcFileName.substring(0, srcFileName.lastIndexOf(".") + 1) + "jpg"));
      String output = srcFileName.substring(0, srcFileName.lastIndexOf(".") + 1) + "jpg";
      return new File(output);
    } catch (IOException e) {
      logger.error("pngTurntoJPG error!", e);
    }
    return null;
  }
}
