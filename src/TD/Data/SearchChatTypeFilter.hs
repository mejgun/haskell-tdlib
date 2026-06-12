module TD.Data.SearchChatTypeFilter
  (SearchChatTypeFilter(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents a filter for type of the chats to search for
data SearchChatTypeFilter
  = SearchChatTypeFilterBot -- ^ Returns only private chats with bots
  | SearchChatTypeFilterChannel -- ^ Returns only channel chats
  deriving (Eq, Show)

instance I.ShortShow SearchChatTypeFilter where
  shortShow SearchChatTypeFilterBot
      = "SearchChatTypeFilterBot"
  shortShow SearchChatTypeFilterChannel
      = "SearchChatTypeFilterChannel"

instance AT.FromJSON SearchChatTypeFilter where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "searchChatTypeFilterBot"     -> pure SearchChatTypeFilterBot
      "searchChatTypeFilterChannel" -> pure SearchChatTypeFilterChannel
      _                             -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON SearchChatTypeFilter where
  toJSON SearchChatTypeFilterBot
      = A.object
        [ "@type" A..= AT.String "searchChatTypeFilterBot"
        ]
  toJSON SearchChatTypeFilterChannel
      = A.object
        [ "@type" A..= AT.String "searchChatTypeFilterChannel"
        ]

