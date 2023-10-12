module TD.Data.Ok where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data Ok
  = Ok -- ^ An object of this type is returned on a successful function call for certain functions
  deriving (Eq)

instance Show Ok where
  show Ok
      = "Ok"

instance AT.FromJSON Ok where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "ok" -> pure Ok
      _    -> mempty
    

instance AT.ToJSON Ok where
  toJSON Ok
      = A.object
        [ "@type" A..= AT.String "ok"
        ]
