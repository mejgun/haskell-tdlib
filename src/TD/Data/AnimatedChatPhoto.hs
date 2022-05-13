{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AnimatedChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified Utils as U

data AnimatedChatPhoto = -- | Animated variant of a chat photo in MPEG4 format
  AnimatedChatPhoto
  { -- | Timestamp of the frame, used as a static chat photo
    main_frame_timestamp :: Maybe Float,
    -- | Information about the animation file
    file :: Maybe File.File,
    -- | Animation width and height
    _length :: Maybe Int
  }
  deriving (Eq)

instance Show AnimatedChatPhoto where
  show
    AnimatedChatPhoto
      { main_frame_timestamp = main_frame_timestamp_,
        file = file_,
        _length = _length_
      } =
      "AnimatedChatPhoto"
        ++ U.cc
          [ U.p "main_frame_timestamp" main_frame_timestamp_,
            U.p "file" file_,
            U.p "_length" _length_
          ]

instance T.FromJSON AnimatedChatPhoto where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "animatedChatPhoto" -> parseAnimatedChatPhoto v
      _ -> mempty
    where
      parseAnimatedChatPhoto :: A.Value -> T.Parser AnimatedChatPhoto
      parseAnimatedChatPhoto = A.withObject "AnimatedChatPhoto" $ \o -> do
        main_frame_timestamp_ <- o A..:? "main_frame_timestamp"
        file_ <- o A..:? "file"
        _length_ <- mconcat [o A..:? "length", U.rm <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ AnimatedChatPhoto {main_frame_timestamp = main_frame_timestamp_, file = file_, _length = _length_}
  parseJSON _ = mempty

instance T.ToJSON AnimatedChatPhoto where
  toJSON
    AnimatedChatPhoto
      { main_frame_timestamp = main_frame_timestamp_,
        file = file_,
        _length = _length_
      } =
      A.object
        [ "@type" A..= T.String "animatedChatPhoto",
          "main_frame_timestamp" A..= main_frame_timestamp_,
          "file" A..= file_,
          "length" A..= _length_
        ]
