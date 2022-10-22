{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FormattedText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TextEntity as TextEntity
import qualified Utils as U

-- |
data FormattedText = -- | A text with some entities @text The text @entities Entities contained in the text. Entities can be nested, but must not mutually intersect with each other.
  -- Pre, Code and PreCode entities can't contain other entities. Bold, Italic, Underline, Strikethrough, and Spoiler entities can contain and can be part of any other entities. All other entities can't contain each other
  FormattedText
  { -- |
    entities :: Maybe [TextEntity.TextEntity],
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show FormattedText where
  show
    FormattedText
      { entities = entities_,
        text = text_
      } =
      "FormattedText"
        ++ U.cc
          [ U.p "entities" entities_,
            U.p "text" text_
          ]

instance T.FromJSON FormattedText where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "formattedText" -> parseFormattedText v
      _ -> mempty
    where
      parseFormattedText :: A.Value -> T.Parser FormattedText
      parseFormattedText = A.withObject "FormattedText" $ \o -> do
        entities_ <- o A..:? "entities"
        text_ <- o A..:? "text"
        return $ FormattedText {entities = entities_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON FormattedText where
  toJSON
    FormattedText
      { entities = entities_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "formattedText",
          "entities" A..= entities_,
          "text" A..= text_
        ]
