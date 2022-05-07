{-# LANGUAGE OverloadedStrings #-}

module TD.Data.AttachmentMenuBotColor where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data AttachmentMenuBotColor = -- | Describes a color to highlight a bot added to attachment menu @light_color Color in the RGB24 format for light themes @dark_color Color in the RGB24 format for dark themes
  AttachmentMenuBotColor
  { -- |
    dark_color :: Maybe Int,
    -- |
    light_color :: Maybe Int
  }
  deriving (Eq)

instance Show AttachmentMenuBotColor where
  show
    AttachmentMenuBotColor
      { dark_color = dark_color,
        light_color = light_color
      } =
      "AttachmentMenuBotColor"
        ++ U.cc
          [ U.p "dark_color" dark_color,
            U.p "light_color" light_color
          ]

instance T.FromJSON AttachmentMenuBotColor where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "attachmentMenuBotColor" -> parseAttachmentMenuBotColor v
      _ -> mempty
    where
      parseAttachmentMenuBotColor :: A.Value -> T.Parser AttachmentMenuBotColor
      parseAttachmentMenuBotColor = A.withObject "AttachmentMenuBotColor" $ \o -> do
        dark_color_ <- mconcat [o A..:? "dark_color", U.rm <$> (o A..: "dark_color" :: T.Parser String)] :: T.Parser (Maybe Int)
        light_color_ <- mconcat [o A..:? "light_color", U.rm <$> (o A..: "light_color" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ AttachmentMenuBotColor {dark_color = dark_color_, light_color = light_color_}
  parseJSON _ = mempty

instance T.ToJSON AttachmentMenuBotColor where
  toJSON
    AttachmentMenuBotColor
      { dark_color = dark_color,
        light_color = light_color
      } =
      A.object
        [ "@type" A..= T.String "attachmentMenuBotColor",
          "dark_color" A..= dark_color,
          "light_color" A..= light_color
        ]
