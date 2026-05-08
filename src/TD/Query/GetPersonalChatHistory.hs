module TD.Query.GetPersonalChatHistory
  (GetPersonalChatHistory(..)
  , defaultGetPersonalChatHistory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns messages in the personal chat of a given user; for bots only. Returns 'TD.Data.Messages.Messages'
data GetPersonalChatHistory
  = GetPersonalChatHistory
    { user_id :: Maybe Int -- ^ User identifier
    , limit   :: Maybe Int -- ^ The maximum number of messages to be returned; 1-20
    }
  deriving (Eq, Show)

instance I.ShortShow GetPersonalChatHistory where
  shortShow
    GetPersonalChatHistory
      { user_id = user_id_
      , limit   = limit_
      }
        = "GetPersonalChatHistory"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON GetPersonalChatHistory where
  toJSON
    GetPersonalChatHistory
      { user_id = user_id_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "getPersonalChatHistory"
          , "user_id" A..= user_id_
          , "limit"   A..= limit_
          ]

defaultGetPersonalChatHistory :: GetPersonalChatHistory
defaultGetPersonalChatHistory =
  GetPersonalChatHistory
    { user_id = Nothing
    , limit   = Nothing
    }

