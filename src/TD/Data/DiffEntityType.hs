module TD.Data.DiffEntityType
  (DiffEntityType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents a change of a text
data DiffEntityType
  = DiffEntityTypeInsert -- ^ Addition of some text
  | DiffEntityTypeReplace -- ^ Change of some text
    { old_text :: Maybe T.Text -- ^ The old text
    }
  | DiffEntityTypeDelete -- ^ Removal of some text
  deriving (Eq, Show)

instance I.ShortShow DiffEntityType where
  shortShow DiffEntityTypeInsert
      = "DiffEntityTypeInsert"
  shortShow DiffEntityTypeReplace
    { old_text = old_text_
    }
      = "DiffEntityTypeReplace"
        ++ I.cc
        [ "old_text" `I.p` old_text_
        ]
  shortShow DiffEntityTypeDelete
      = "DiffEntityTypeDelete"

instance AT.FromJSON DiffEntityType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "diffEntityTypeInsert"  -> pure DiffEntityTypeInsert
      "diffEntityTypeReplace" -> parseDiffEntityTypeReplace v
      "diffEntityTypeDelete"  -> pure DiffEntityTypeDelete
      _                       -> mempty
    
    where
      parseDiffEntityTypeReplace :: A.Value -> AT.Parser DiffEntityType
      parseDiffEntityTypeReplace = A.withObject "DiffEntityTypeReplace" $ \o -> do
        old_text_ <- o A..:?  "old_text"
        pure $ DiffEntityTypeReplace
          { old_text = old_text_
          }
  parseJSON _ = mempty

