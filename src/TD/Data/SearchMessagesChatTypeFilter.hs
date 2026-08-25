module TD.Data.SearchMessagesChatTypeFilter
  (SearchMessagesChatTypeFilter(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents a filter for type of the chats in which to search for messages
data SearchMessagesChatTypeFilter
  = SearchMessagesChatTypeFilterPrivate -- ^ Returns only messages in private chats
  | SearchMessagesChatTypeFilterGroup -- ^ Returns only messages in basic group and supergroup chats
  | SearchMessagesChatTypeFilterChannel -- ^ Returns only messages in channel chats
  | SearchMessagesChatTypeFilterCommunity -- ^ Returns only messages in the specified community
    { community_id :: Maybe Int -- ^ Identifier of the community to search in
    }
  deriving (Eq, Show)

instance I.ShortShow SearchMessagesChatTypeFilter where
  shortShow SearchMessagesChatTypeFilterPrivate
      = "SearchMessagesChatTypeFilterPrivate"
  shortShow SearchMessagesChatTypeFilterGroup
      = "SearchMessagesChatTypeFilterGroup"
  shortShow SearchMessagesChatTypeFilterChannel
      = "SearchMessagesChatTypeFilterChannel"
  shortShow SearchMessagesChatTypeFilterCommunity
    { community_id = community_id_
    }
      = "SearchMessagesChatTypeFilterCommunity"
        ++ I.cc
        [ "community_id" `I.p` community_id_
        ]

instance AT.FromJSON SearchMessagesChatTypeFilter where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "searchMessagesChatTypeFilterPrivate"   -> pure SearchMessagesChatTypeFilterPrivate
      "searchMessagesChatTypeFilterGroup"     -> pure SearchMessagesChatTypeFilterGroup
      "searchMessagesChatTypeFilterChannel"   -> pure SearchMessagesChatTypeFilterChannel
      "searchMessagesChatTypeFilterCommunity" -> parseSearchMessagesChatTypeFilterCommunity v
      _                                       -> mempty
    
    where
      parseSearchMessagesChatTypeFilterCommunity :: A.Value -> AT.Parser SearchMessagesChatTypeFilter
      parseSearchMessagesChatTypeFilterCommunity = A.withObject "SearchMessagesChatTypeFilterCommunity" $ \o -> do
        community_id_ <- o A..:?  "community_id"
        pure $ SearchMessagesChatTypeFilterCommunity
          { community_id = community_id_
          }
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
  toJSON SearchMessagesChatTypeFilterCommunity
    { community_id = community_id_
    }
      = A.object
        [ "@type"        A..= AT.String "searchMessagesChatTypeFilterCommunity"
        , "community_id" A..= community_id_
        ]

