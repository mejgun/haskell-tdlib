module TD.Query.SearchPublicChat(SearchPublicChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SearchPublicChat -- ^ Searches a public chat by its username. Currently, only private chats, supergroups and channels can be public. Returns the chat if found; otherwise, an error is returned
  = SearchPublicChat
    { username :: Maybe T.Text -- ^ Username to be resolved
    }
  deriving (Eq)

instance Show SearchPublicChat where
  show
    SearchPublicChat
      { username = username_
      }
        = "SearchPublicChat"
          ++ I.cc
          [ "username" `I.p` username_
          ]

instance AT.ToJSON SearchPublicChat where
  toJSON
    SearchPublicChat
      { username = username_
      }
        = A.object
          [ "@type"    A..= AT.String "searchPublicChat"
          , "username" A..= username_
          ]
