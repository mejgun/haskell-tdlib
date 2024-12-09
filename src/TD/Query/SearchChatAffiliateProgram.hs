module TD.Query.SearchChatAffiliateProgram
  (SearchChatAffiliateProgram(..)
  , defaultSearchChatAffiliateProgram
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches a chat with an affiliate program. Returns the chat if found and the program is active. Returns 'TD.Data.Chat.Chat'
data SearchChatAffiliateProgram
  = SearchChatAffiliateProgram
    { username :: Maybe T.Text -- ^ Username of the chat
    , referrer :: Maybe T.Text -- ^ The referrer from an internalLinkTypeChatAffiliateProgram link
    }
  deriving (Eq, Show)

instance I.ShortShow SearchChatAffiliateProgram where
  shortShow
    SearchChatAffiliateProgram
      { username = username_
      , referrer = referrer_
      }
        = "SearchChatAffiliateProgram"
          ++ I.cc
          [ "username" `I.p` username_
          , "referrer" `I.p` referrer_
          ]

instance AT.ToJSON SearchChatAffiliateProgram where
  toJSON
    SearchChatAffiliateProgram
      { username = username_
      , referrer = referrer_
      }
        = A.object
          [ "@type"    A..= AT.String "searchChatAffiliateProgram"
          , "username" A..= username_
          , "referrer" A..= referrer_
          ]

defaultSearchChatAffiliateProgram :: SearchChatAffiliateProgram
defaultSearchChatAffiliateProgram =
  SearchChatAffiliateProgram
    { username = Nothing
    , referrer = Nothing
    }

