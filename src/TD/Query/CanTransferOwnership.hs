module TD.Query.CanTransferOwnership
  (CanTransferOwnership(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Checks whether the current session can be used to transfer a chat ownership to another user. Returns 'TD.Data.CanTransferOwnershipResult.CanTransferOwnershipResult'
data CanTransferOwnership
  = CanTransferOwnership
  deriving (Eq, Show)

instance I.ShortShow CanTransferOwnership where
  shortShow
    CanTransferOwnership
        = "CanTransferOwnership"

instance AT.ToJSON CanTransferOwnership where
  toJSON
    CanTransferOwnership
        = A.object
          [ "@type" A..= AT.String "canTransferOwnership"
          ]

