{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Minithumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Minithumbnail = -- | Thumbnail image of a very poor quality and low resolution @width Thumbnail width, usually doesn't exceed 40 @height Thumbnail height, usually doesn't exceed 40 @data The thumbnail in JPEG format
  Minithumbnail
  { -- |
    _data :: Maybe String,
    -- |
    height :: Maybe Int,
    -- |
    width :: Maybe Int
  }
  deriving (Eq)

instance Show Minithumbnail where
  show
    Minithumbnail
      { _data = _data,
        height = height,
        width = width
      } =
      "Minithumbnail"
        ++ U.cc
          [ U.p "_data" _data,
            U.p "height" height,
            U.p "width" width
          ]

instance T.FromJSON Minithumbnail where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "minithumbnail" -> parseMinithumbnail v
      _ -> fail ""
    where
      parseMinithumbnail :: A.Value -> T.Parser Minithumbnail
      parseMinithumbnail = A.withObject "Minithumbnail" $ \o -> do
        _data_ <- o A..:? "data"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Minithumbnail {_data = _data_, height = height_, width = width_}
  parseJSON _ = fail ""

instance T.ToJSON Minithumbnail where
  toJSON
    Minithumbnail
      { _data = _data,
        height = height,
        width = width
      } =
      A.object
        [ "@type" A..= T.String "minithumbnail",
          "data" A..= _data,
          "height" A..= height,
          "width" A..= width
        ]
