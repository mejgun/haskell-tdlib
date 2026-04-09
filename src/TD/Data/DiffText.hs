module TD.Data.DiffText
  (DiffText(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.DiffEntity as DiffEntity

data DiffText
  = DiffText -- ^ A text with some changes highlighted
    { text     :: Maybe T.Text                  -- ^ The text
    , entities :: Maybe [DiffEntity.DiffEntity] -- ^ Entities describing changes in the text. Entities don't mutually intersect with each other
    }
  deriving (Eq, Show)

instance I.ShortShow DiffText where
  shortShow DiffText
    { text     = text_
    , entities = entities_
    }
      = "DiffText"
        ++ I.cc
        [ "text"     `I.p` text_
        , "entities" `I.p` entities_
        ]

instance AT.FromJSON DiffText where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "diffText" -> parseDiffText v
      _          -> mempty
    
    where
      parseDiffText :: A.Value -> AT.Parser DiffText
      parseDiffText = A.withObject "DiffText" $ \o -> do
        text_     <- o A..:?  "text"
        entities_ <- o A..:?  "entities"
        pure $ DiffText
          { text     = text_
          , entities = entities_
          }
  parseJSON _ = mempty

