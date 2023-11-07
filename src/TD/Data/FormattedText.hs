module TD.Data.FormattedText
  ( FormattedText(..)    
  , defaultFormattedText 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TextEntity as TextEntity

data FormattedText
  = FormattedText -- ^ A text with some entities
    { text     :: Maybe T.Text                  -- ^ The text
    , entities :: Maybe [TextEntity.TextEntity] -- ^ Entities contained in the text. Entities can be nested, but must not mutually intersect with each other. Pre, Code and PreCode entities can't contain other entities. BlockQuote entities can't contain other BlockQuote entities. Bold, Italic, Underline, Strikethrough, and Spoiler entities can contain and can be part of any other entities. All other entities can't contain each other
    }
  deriving (Eq, Show)

instance I.ShortShow FormattedText where
  shortShow FormattedText
    { text     = text_
    , entities = entities_
    }
      = "FormattedText"
        ++ I.cc
        [ "text"     `I.p` text_
        , "entities" `I.p` entities_
        ]

instance AT.FromJSON FormattedText where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "formattedText" -> parseFormattedText v
      _               -> mempty
    
    where
      parseFormattedText :: A.Value -> AT.Parser FormattedText
      parseFormattedText = A.withObject "FormattedText" $ \o -> do
        text_     <- o A..:?  "text"
        entities_ <- o A..:?  "entities"
        pure $ FormattedText
          { text     = text_
          , entities = entities_
          }
  parseJSON _ = mempty

instance AT.ToJSON FormattedText where
  toJSON FormattedText
    { text     = text_
    , entities = entities_
    }
      = A.object
        [ "@type"    A..= AT.String "formattedText"
        , "text"     A..= text_
        , "entities" A..= entities_
        ]

defaultFormattedText :: FormattedText
defaultFormattedText =
  FormattedText
    { text     = Nothing
    , entities = Nothing
    }

