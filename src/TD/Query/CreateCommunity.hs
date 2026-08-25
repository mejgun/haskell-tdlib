module TD.Query.CreateCommunity
  (CreateCommunity(..)
  , defaultCreateCommunity
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a new community for the given chat. Returns identifier of the created community. Returns 'TD.Data.CommunityId.CommunityId'
data CreateCommunity
  = CreateCommunity
    { name           :: Maybe T.Text -- ^ Name of the new community
    , chat_id        :: Maybe Int    -- ^ Identifier of the chat in the community; only chats with owned bots and owned basic group, supergroup and channel chats are allowed; basic group chats will be automatically upgraded to supergroup chats
    , is_chat_hidden :: Maybe Bool   -- ^ Pass true if the chat will be visible only to administrators of the community
    }
  deriving (Eq, Show)

instance I.ShortShow CreateCommunity where
  shortShow
    CreateCommunity
      { name           = name_
      , chat_id        = chat_id_
      , is_chat_hidden = is_chat_hidden_
      }
        = "CreateCommunity"
          ++ I.cc
          [ "name"           `I.p` name_
          , "chat_id"        `I.p` chat_id_
          , "is_chat_hidden" `I.p` is_chat_hidden_
          ]

instance AT.ToJSON CreateCommunity where
  toJSON
    CreateCommunity
      { name           = name_
      , chat_id        = chat_id_
      , is_chat_hidden = is_chat_hidden_
      }
        = A.object
          [ "@type"          A..= AT.String "createCommunity"
          , "name"           A..= name_
          , "chat_id"        A..= chat_id_
          , "is_chat_hidden" A..= is_chat_hidden_
          ]

defaultCreateCommunity :: CreateCommunity
defaultCreateCommunity =
  CreateCommunity
    { name           = Nothing
    , chat_id        = Nothing
    , is_chat_hidden = Nothing
    }

