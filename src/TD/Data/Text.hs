{-# LANGUAGE OverloadedStrings #-}

module TD.Data.Text where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Text = -- | Contains some text @text Text
  Text
  { -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show Text where
  show
    Text
      { text = text
      } =
      "Text"
        ++ U.cc
          [ U.p "text" text
          ]

instance T.FromJSON Text where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "text" -> parseText v
      _ -> mempty
    where
      parseText :: A.Value -> T.Parser Text
      parseText = A.withObject "Text" $ \o -> do
        text_ <- o A..:? "text"
        return $ Text {text = text_}
  parseJSON _ = mempty

instance T.ToJSON Text where
  toJSON
    Text
      { text = text
      } =
      A.object
        [ "@type" A..= T.String "text",
          "text" A..= text
        ]
