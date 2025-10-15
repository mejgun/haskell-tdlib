module TD.Data.SupergroupMembersFilter
  (SupergroupMembersFilter(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.MessageTopic as MessageTopic

-- | Specifies the kind of chat members to return in getSupergroupMembers
data SupergroupMembersFilter
  = SupergroupMembersFilterRecent -- ^ Returns recently active users in reverse chronological order
  | SupergroupMembersFilterContacts -- ^ Returns contacts of the user, which are members of the supergroup or channel
    { query :: Maybe T.Text -- ^ Query to search for
    }
  | SupergroupMembersFilterAdministrators -- ^ Returns the owner and administrators
  | SupergroupMembersFilterSearch -- ^ Used to search for supergroup or channel members via a (string) query
    { query :: Maybe T.Text -- ^ Query to search for
    }
  | SupergroupMembersFilterRestricted -- ^ Returns restricted supergroup members; can be used only by administrators
    { query :: Maybe T.Text -- ^ Query to search for
    }
  | SupergroupMembersFilterBanned -- ^ Returns users banned from the supergroup or channel; can be used only by administrators
    { query :: Maybe T.Text -- ^ Query to search for
    }
  | SupergroupMembersFilterMention -- ^ Returns users which can be mentioned in the supergroup
    { query    :: Maybe T.Text                    -- ^ Query to search for
    , topic_id :: Maybe MessageTopic.MessageTopic -- ^ Identifier of the topic in which the users will be mentioned; pass null if none
    }
  | SupergroupMembersFilterBots -- ^ Returns bot members of the supergroup or channel
  deriving (Eq, Show)

instance I.ShortShow SupergroupMembersFilter where
  shortShow SupergroupMembersFilterRecent
      = "SupergroupMembersFilterRecent"
  shortShow SupergroupMembersFilterContacts
    { query = query_
    }
      = "SupergroupMembersFilterContacts"
        ++ I.cc
        [ "query" `I.p` query_
        ]
  shortShow SupergroupMembersFilterAdministrators
      = "SupergroupMembersFilterAdministrators"
  shortShow SupergroupMembersFilterSearch
    { query = query_
    }
      = "SupergroupMembersFilterSearch"
        ++ I.cc
        [ "query" `I.p` query_
        ]
  shortShow SupergroupMembersFilterRestricted
    { query = query_
    }
      = "SupergroupMembersFilterRestricted"
        ++ I.cc
        [ "query" `I.p` query_
        ]
  shortShow SupergroupMembersFilterBanned
    { query = query_
    }
      = "SupergroupMembersFilterBanned"
        ++ I.cc
        [ "query" `I.p` query_
        ]
  shortShow SupergroupMembersFilterMention
    { query    = query_
    , topic_id = topic_id_
    }
      = "SupergroupMembersFilterMention"
        ++ I.cc
        [ "query"    `I.p` query_
        , "topic_id" `I.p` topic_id_
        ]
  shortShow SupergroupMembersFilterBots
      = "SupergroupMembersFilterBots"

instance AT.FromJSON SupergroupMembersFilter where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "supergroupMembersFilterRecent"         -> pure SupergroupMembersFilterRecent
      "supergroupMembersFilterContacts"       -> parseSupergroupMembersFilterContacts v
      "supergroupMembersFilterAdministrators" -> pure SupergroupMembersFilterAdministrators
      "supergroupMembersFilterSearch"         -> parseSupergroupMembersFilterSearch v
      "supergroupMembersFilterRestricted"     -> parseSupergroupMembersFilterRestricted v
      "supergroupMembersFilterBanned"         -> parseSupergroupMembersFilterBanned v
      "supergroupMembersFilterMention"        -> parseSupergroupMembersFilterMention v
      "supergroupMembersFilterBots"           -> pure SupergroupMembersFilterBots
      _                                       -> mempty
    
    where
      parseSupergroupMembersFilterContacts :: A.Value -> AT.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterContacts = A.withObject "SupergroupMembersFilterContacts" $ \o -> do
        query_ <- o A..:?  "query"
        pure $ SupergroupMembersFilterContacts
          { query = query_
          }
      parseSupergroupMembersFilterSearch :: A.Value -> AT.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterSearch = A.withObject "SupergroupMembersFilterSearch" $ \o -> do
        query_ <- o A..:?  "query"
        pure $ SupergroupMembersFilterSearch
          { query = query_
          }
      parseSupergroupMembersFilterRestricted :: A.Value -> AT.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterRestricted = A.withObject "SupergroupMembersFilterRestricted" $ \o -> do
        query_ <- o A..:?  "query"
        pure $ SupergroupMembersFilterRestricted
          { query = query_
          }
      parseSupergroupMembersFilterBanned :: A.Value -> AT.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterBanned = A.withObject "SupergroupMembersFilterBanned" $ \o -> do
        query_ <- o A..:?  "query"
        pure $ SupergroupMembersFilterBanned
          { query = query_
          }
      parseSupergroupMembersFilterMention :: A.Value -> AT.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterMention = A.withObject "SupergroupMembersFilterMention" $ \o -> do
        query_    <- o A..:?  "query"
        topic_id_ <- o A..:?  "topic_id"
        pure $ SupergroupMembersFilterMention
          { query    = query_
          , topic_id = topic_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON SupergroupMembersFilter where
  toJSON SupergroupMembersFilterRecent
      = A.object
        [ "@type" A..= AT.String "supergroupMembersFilterRecent"
        ]
  toJSON SupergroupMembersFilterContacts
    { query = query_
    }
      = A.object
        [ "@type" A..= AT.String "supergroupMembersFilterContacts"
        , "query" A..= query_
        ]
  toJSON SupergroupMembersFilterAdministrators
      = A.object
        [ "@type" A..= AT.String "supergroupMembersFilterAdministrators"
        ]
  toJSON SupergroupMembersFilterSearch
    { query = query_
    }
      = A.object
        [ "@type" A..= AT.String "supergroupMembersFilterSearch"
        , "query" A..= query_
        ]
  toJSON SupergroupMembersFilterRestricted
    { query = query_
    }
      = A.object
        [ "@type" A..= AT.String "supergroupMembersFilterRestricted"
        , "query" A..= query_
        ]
  toJSON SupergroupMembersFilterBanned
    { query = query_
    }
      = A.object
        [ "@type" A..= AT.String "supergroupMembersFilterBanned"
        , "query" A..= query_
        ]
  toJSON SupergroupMembersFilterMention
    { query    = query_
    , topic_id = topic_id_
    }
      = A.object
        [ "@type"    A..= AT.String "supergroupMembersFilterMention"
        , "query"    A..= query_
        , "topic_id" A..= topic_id_
        ]
  toJSON SupergroupMembersFilterBots
      = A.object
        [ "@type" A..= AT.String "supergroupMembersFilterBots"
        ]

