module TD.Query.GetBotToken
  (GetBotToken(..)
  , defaultGetBotToken
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns token of a created bot; for bots only. Returns 'TD.Data.Text.Text'
data GetBotToken
  = GetBotToken
    { bot_user_id :: Maybe Int  -- ^ Identifier of the created bot
    , revoke      :: Maybe Bool -- ^ Pass true to revoke the current token and create a new one
    }
  deriving (Eq, Show)

instance I.ShortShow GetBotToken where
  shortShow
    GetBotToken
      { bot_user_id = bot_user_id_
      , revoke      = revoke_
      }
        = "GetBotToken"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "revoke"      `I.p` revoke_
          ]

instance AT.ToJSON GetBotToken where
  toJSON
    GetBotToken
      { bot_user_id = bot_user_id_
      , revoke      = revoke_
      }
        = A.object
          [ "@type"       A..= AT.String "getBotToken"
          , "bot_user_id" A..= bot_user_id_
          , "revoke"      A..= revoke_
          ]

defaultGetBotToken :: GetBotToken
defaultGetBotToken =
  GetBotToken
    { bot_user_id = Nothing
    , revoke      = Nothing
    }

