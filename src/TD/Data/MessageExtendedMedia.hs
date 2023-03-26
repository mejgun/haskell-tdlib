{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageExtendedMedia where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Video as Video
import qualified Utils as U

-- | Describes a media, which is attached to an invoice
data MessageExtendedMedia
  = -- | The media is hidden until the invoice is paid
    MessageExtendedMediaPreview
      { -- | Media caption
        caption :: Maybe FormattedText.FormattedText,
        -- | Media minithumbnail; may be null
        minithumbnail :: Maybe Minithumbnail.Minithumbnail,
        -- | Media duration; 0 if unknown
        duration :: Maybe Int,
        -- | Media height; 0 if unknown
        height :: Maybe Int,
        -- | Media width; 0 if unknown
        width :: Maybe Int
      }
  | -- | The media is a photo @photo The photo @caption Photo caption
    MessageExtendedMediaPhoto
      { -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        photo :: Maybe Photo.Photo
      }
  | -- | The media is a video @video The video @caption Photo caption
    MessageExtendedMediaVideo
      { -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        video :: Maybe Video.Video
      }
  | -- | The media is unsupported @caption Media caption
    MessageExtendedMediaUnsupported
      { -- |
        caption :: Maybe FormattedText.FormattedText
      }
  deriving (Eq)

instance Show MessageExtendedMedia where
  show
    MessageExtendedMediaPreview
      { caption = caption_,
        minithumbnail = minithumbnail_,
        duration = duration_,
        height = height_,
        width = width_
      } =
      "MessageExtendedMediaPreview"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "minithumbnail" minithumbnail_,
            U.p "duration" duration_,
            U.p "height" height_,
            U.p "width" width_
          ]
  show
    MessageExtendedMediaPhoto
      { caption = caption_,
        photo = photo_
      } =
      "MessageExtendedMediaPhoto"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "photo" photo_
          ]
  show
    MessageExtendedMediaVideo
      { caption = caption_,
        video = video_
      } =
      "MessageExtendedMediaVideo"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "video" video_
          ]
  show
    MessageExtendedMediaUnsupported
      { caption = caption_
      } =
      "MessageExtendedMediaUnsupported"
        ++ U.cc
          [ U.p "caption" caption_
          ]

instance T.FromJSON MessageExtendedMedia where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageExtendedMediaPreview" -> parseMessageExtendedMediaPreview v
      "messageExtendedMediaPhoto" -> parseMessageExtendedMediaPhoto v
      "messageExtendedMediaVideo" -> parseMessageExtendedMediaVideo v
      "messageExtendedMediaUnsupported" -> parseMessageExtendedMediaUnsupported v
      _ -> mempty
    where
      parseMessageExtendedMediaPreview :: A.Value -> T.Parser MessageExtendedMedia
      parseMessageExtendedMediaPreview = A.withObject "MessageExtendedMediaPreview" $ \o -> do
        caption_ <- o A..:? "caption"
        minithumbnail_ <- o A..:? "minithumbnail"
        duration_ <- o A..:? "duration"
        height_ <- o A..:? "height"
        width_ <- o A..:? "width"
        return $ MessageExtendedMediaPreview {caption = caption_, minithumbnail = minithumbnail_, duration = duration_, height = height_, width = width_}

      parseMessageExtendedMediaPhoto :: A.Value -> T.Parser MessageExtendedMedia
      parseMessageExtendedMediaPhoto = A.withObject "MessageExtendedMediaPhoto" $ \o -> do
        caption_ <- o A..:? "caption"
        photo_ <- o A..:? "photo"
        return $ MessageExtendedMediaPhoto {caption = caption_, photo = photo_}

      parseMessageExtendedMediaVideo :: A.Value -> T.Parser MessageExtendedMedia
      parseMessageExtendedMediaVideo = A.withObject "MessageExtendedMediaVideo" $ \o -> do
        caption_ <- o A..:? "caption"
        video_ <- o A..:? "video"
        return $ MessageExtendedMediaVideo {caption = caption_, video = video_}

      parseMessageExtendedMediaUnsupported :: A.Value -> T.Parser MessageExtendedMedia
      parseMessageExtendedMediaUnsupported = A.withObject "MessageExtendedMediaUnsupported" $ \o -> do
        caption_ <- o A..:? "caption"
        return $ MessageExtendedMediaUnsupported {caption = caption_}
  parseJSON _ = mempty

instance T.ToJSON MessageExtendedMedia where
  toJSON
    MessageExtendedMediaPreview
      { caption = caption_,
        minithumbnail = minithumbnail_,
        duration = duration_,
        height = height_,
        width = width_
      } =
      A.object
        [ "@type" A..= T.String "messageExtendedMediaPreview",
          "caption" A..= caption_,
          "minithumbnail" A..= minithumbnail_,
          "duration" A..= duration_,
          "height" A..= height_,
          "width" A..= width_
        ]
  toJSON
    MessageExtendedMediaPhoto
      { caption = caption_,
        photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "messageExtendedMediaPhoto",
          "caption" A..= caption_,
          "photo" A..= photo_
        ]
  toJSON
    MessageExtendedMediaVideo
      { caption = caption_,
        video = video_
      } =
      A.object
        [ "@type" A..= T.String "messageExtendedMediaVideo",
          "caption" A..= caption_,
          "video" A..= video_
        ]
  toJSON
    MessageExtendedMediaUnsupported
      { caption = caption_
      } =
      A.object
        [ "@type" A..= T.String "messageExtendedMediaUnsupported",
          "caption" A..= caption_
        ]
