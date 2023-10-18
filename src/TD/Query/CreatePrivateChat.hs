module TD.Query.CreatePrivateChat
  (CreatePrivateChat(..)
  , defaultCreatePrivateChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an existing chat corresponding to a given user. Returns 'TD.Data.Chat.Chat'
data CreatePrivateChat
  = CreatePrivateChat
    { user_id :: Maybe Int  -- ^ User identifier
    , force   :: Maybe Bool -- ^ Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
    }
  deriving (Eq, Show)

instance I.ShortShow CreatePrivateChat where
  shortShow
    CreatePrivateChat
      { user_id = user_id_
      , force   = force_
      }
        = "CreatePrivateChat"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "force"   `I.p` force_
          ]

instance AT.ToJSON CreatePrivateChat where
  toJSON
    CreatePrivateChat
      { user_id = user_id_
      , force   = force_
      }
        = A.object
          [ "@type"   A..= AT.String "createPrivateChat"
          , "user_id" A..= user_id_
          , "force"   A..= force_
          ]

defaultCreatePrivateChat :: CreatePrivateChat
defaultCreatePrivateChat =
  CreatePrivateChat
    { user_id = Nothing
    , force   = Nothing
    }

