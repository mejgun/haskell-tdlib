module TD.Query.CanSendMessageToUser
  (CanSendMessageToUser(..)
  , defaultCanSendMessageToUser
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Check whether the current user can message another user or try to create a chat with them. Returns 'TD.Data.CanSendMessageToUserResult.CanSendMessageToUserResult'
data CanSendMessageToUser
  = CanSendMessageToUser
    { user_id    :: Maybe Int  -- ^ Identifier of the other user
    , only_local :: Maybe Bool -- ^ Pass true to get only locally available information without sending network requests
    }
  deriving (Eq, Show)

instance I.ShortShow CanSendMessageToUser where
  shortShow
    CanSendMessageToUser
      { user_id    = user_id_
      , only_local = only_local_
      }
        = "CanSendMessageToUser"
          ++ I.cc
          [ "user_id"    `I.p` user_id_
          , "only_local" `I.p` only_local_
          ]

instance AT.ToJSON CanSendMessageToUser where
  toJSON
    CanSendMessageToUser
      { user_id    = user_id_
      , only_local = only_local_
      }
        = A.object
          [ "@type"      A..= AT.String "canSendMessageToUser"
          , "user_id"    A..= user_id_
          , "only_local" A..= only_local_
          ]

defaultCanSendMessageToUser :: CanSendMessageToUser
defaultCanSendMessageToUser =
  CanSendMessageToUser
    { user_id    = Nothing
    , only_local = Nothing
    }

