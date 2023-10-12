module TD.Query.CanTransferOwnership where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CanTransferOwnership -- ^ Checks whether the current session can be used to transfer a chat ownership to another user
  = CanTransferOwnership
  deriving (Eq)

instance Show CanTransferOwnership where
  show
    CanTransferOwnership
        = "CanTransferOwnership"

instance AT.ToJSON CanTransferOwnership where
  toJSON
    CanTransferOwnership
        = A.object
          [ "@type" A..= AT.String "canTransferOwnership"
          ]
