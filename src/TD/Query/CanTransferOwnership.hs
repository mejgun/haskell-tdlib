module TD.Query.CanTransferOwnership
  (CanTransferOwnership(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

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

