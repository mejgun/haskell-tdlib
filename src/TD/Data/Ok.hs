module TD.Data.Ok
  (Ok(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Ok
  = Ok -- ^ An object of this type is returned on a successful function call for certain functions
  deriving (Eq, Show)

instance I.ShortShow Ok where
  shortShow Ok
      = "Ok"

instance AT.FromJSON Ok where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "ok" -> pure Ok
      _    -> mempty
    
  parseJSON _ = mempty

