module TD.Data.SearchMessagesChatTypeFilter
  (SearchMessagesChatTypeFilter(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents a filter for type of the chats in which to search messages
data SearchMessagesChatTypeFilter
  = SearchMessagesChatTypeFilterPrivate -- ^ Returns only messages in private chats
  | SearchMessagesChatTypeFilterGroup -- ^ Returns only messages in basic group and supergroup chats
  | SearchMessagesChatTypeFilterChannel -- ^ Returns only messages in channel chats
  deriving (Eq, Show)

instance I.ShortShow SearchMessagesChatTypeFilter where
  shortShow SearchMessagesChatTypeFilterPrivate
      = "SearchMessagesChatTypeFilterPrivate"
  shortShow SearchMessagesChatTypeFilterGroup
      = "SearchMessagesChatTypeFilterGroup"
  shortShow SearchMessagesChatTypeFilterChannel
      = "SearchMessagesChatTypeFilterChannel"

instance AT.FromJSON SearchMessagesChatTypeFilter where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "searchMessagesChatTypeFilterPrivate" -> pure SearchMessagesChatTypeFilterPrivate
      "searchMessagesChatTypeFilterGroup"   -> pure SearchMessagesChatTypeFilterGroup
      "searchMessagesChatTypeFilterChannel" -> pure SearchMessagesChatTypeFilterChannel
      _                                     -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON SearchMessagesChatTypeFilter where
  toJSON SearchMessagesChatTypeFilterPrivate
      = A.object
        [ "@type" A..= AT.String "searchMessagesChatTypeFilterPrivate"
        ]
  toJSON SearchMessagesChatTypeFilterGroup
      = A.object
        [ "@type" A..= AT.String "searchMessagesChatTypeFilterGroup"
        ]
  toJSON SearchMessagesChatTypeFilterChannel
      = A.object
        [ "@type" A..= AT.String "searchMessagesChatTypeFilterChannel"
        ]

