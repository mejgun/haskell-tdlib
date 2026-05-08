module TD.Query.GetManagedBotToken
  (GetManagedBotToken(..)
  , defaultGetManagedBotToken
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns token of a managed bot; for bots only. Returns 'TD.Data.Text.Text'
data GetManagedBotToken
  = GetManagedBotToken
    { bot_user_id :: Maybe Int  -- ^ Identifier of the managed bot
    , revoke      :: Maybe Bool -- ^ Pass true to revoke the current token and create a new one
    }
  deriving (Eq, Show)

instance I.ShortShow GetManagedBotToken where
  shortShow
    GetManagedBotToken
      { bot_user_id = bot_user_id_
      , revoke      = revoke_
      }
        = "GetManagedBotToken"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "revoke"      `I.p` revoke_
          ]

instance AT.ToJSON GetManagedBotToken where
  toJSON
    GetManagedBotToken
      { bot_user_id = bot_user_id_
      , revoke      = revoke_
      }
        = A.object
          [ "@type"       A..= AT.String "getManagedBotToken"
          , "bot_user_id" A..= bot_user_id_
          , "revoke"      A..= revoke_
          ]

defaultGetManagedBotToken :: GetManagedBotToken
defaultGetManagedBotToken =
  GetManagedBotToken
    { bot_user_id = Nothing
    , revoke      = Nothing
    }

