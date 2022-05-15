{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SupergroupMembersFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Specifies the kind of chat members to return in getSupergroupMembers
data SupergroupMembersFilter
  = -- | Returns recently active users in reverse chronological order
    SupergroupMembersFilterRecent
  | -- | Returns contacts of the user, which are members of the supergroup or channel @query Query to search for
    SupergroupMembersFilterContacts
      { -- |
        query :: Maybe String
      }
  | -- | Returns the owner and administrators
    SupergroupMembersFilterAdministrators
  | -- | Used to search for supergroup or channel members via a (string) query @query Query to search for
    SupergroupMembersFilterSearch
      { -- |
        query :: Maybe String
      }
  | -- | Returns restricted supergroup members; can be used only by administrators @query Query to search for
    SupergroupMembersFilterRestricted
      { -- |
        query :: Maybe String
      }
  | -- | Returns users banned from the supergroup or channel; can be used only by administrators @query Query to search for
    SupergroupMembersFilterBanned
      { -- |
        query :: Maybe String
      }
  | -- | Returns users which can be mentioned in the supergroup @query Query to search for @message_thread_id If non-zero, the identifier of the current message thread
    SupergroupMembersFilterMention
      { -- |
        message_thread_id :: Maybe Int,
        -- |
        query :: Maybe String
      }
  | -- | Returns bot members of the supergroup or channel
    SupergroupMembersFilterBots
  deriving (Eq)

instance Show SupergroupMembersFilter where
  show SupergroupMembersFilterRecent =
    "SupergroupMembersFilterRecent"
      ++ U.cc
        []
  show
    SupergroupMembersFilterContacts
      { query = query_
      } =
      "SupergroupMembersFilterContacts"
        ++ U.cc
          [ U.p "query" query_
          ]
  show SupergroupMembersFilterAdministrators =
    "SupergroupMembersFilterAdministrators"
      ++ U.cc
        []
  show
    SupergroupMembersFilterSearch
      { query = query_
      } =
      "SupergroupMembersFilterSearch"
        ++ U.cc
          [ U.p "query" query_
          ]
  show
    SupergroupMembersFilterRestricted
      { query = query_
      } =
      "SupergroupMembersFilterRestricted"
        ++ U.cc
          [ U.p "query" query_
          ]
  show
    SupergroupMembersFilterBanned
      { query = query_
      } =
      "SupergroupMembersFilterBanned"
        ++ U.cc
          [ U.p "query" query_
          ]
  show
    SupergroupMembersFilterMention
      { message_thread_id = message_thread_id_,
        query = query_
      } =
      "SupergroupMembersFilterMention"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_,
            U.p "query" query_
          ]
  show SupergroupMembersFilterBots =
    "SupergroupMembersFilterBots"
      ++ U.cc
        []

instance T.FromJSON SupergroupMembersFilter where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "supergroupMembersFilterRecent" -> parseSupergroupMembersFilterRecent v
      "supergroupMembersFilterContacts" -> parseSupergroupMembersFilterContacts v
      "supergroupMembersFilterAdministrators" -> parseSupergroupMembersFilterAdministrators v
      "supergroupMembersFilterSearch" -> parseSupergroupMembersFilterSearch v
      "supergroupMembersFilterRestricted" -> parseSupergroupMembersFilterRestricted v
      "supergroupMembersFilterBanned" -> parseSupergroupMembersFilterBanned v
      "supergroupMembersFilterMention" -> parseSupergroupMembersFilterMention v
      "supergroupMembersFilterBots" -> parseSupergroupMembersFilterBots v
      _ -> mempty
    where
      parseSupergroupMembersFilterRecent :: A.Value -> T.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterRecent = A.withObject "SupergroupMembersFilterRecent" $ \_ -> return SupergroupMembersFilterRecent

      parseSupergroupMembersFilterContacts :: A.Value -> T.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterContacts = A.withObject "SupergroupMembersFilterContacts" $ \o -> do
        query_ <- o A..:? "query"
        return $ SupergroupMembersFilterContacts {query = query_}

      parseSupergroupMembersFilterAdministrators :: A.Value -> T.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterAdministrators = A.withObject "SupergroupMembersFilterAdministrators" $ \_ -> return SupergroupMembersFilterAdministrators

      parseSupergroupMembersFilterSearch :: A.Value -> T.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterSearch = A.withObject "SupergroupMembersFilterSearch" $ \o -> do
        query_ <- o A..:? "query"
        return $ SupergroupMembersFilterSearch {query = query_}

      parseSupergroupMembersFilterRestricted :: A.Value -> T.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterRestricted = A.withObject "SupergroupMembersFilterRestricted" $ \o -> do
        query_ <- o A..:? "query"
        return $ SupergroupMembersFilterRestricted {query = query_}

      parseSupergroupMembersFilterBanned :: A.Value -> T.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterBanned = A.withObject "SupergroupMembersFilterBanned" $ \o -> do
        query_ <- o A..:? "query"
        return $ SupergroupMembersFilterBanned {query = query_}

      parseSupergroupMembersFilterMention :: A.Value -> T.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterMention = A.withObject "SupergroupMembersFilterMention" $ \o -> do
        message_thread_id_ <- o A..:? "message_thread_id"
        query_ <- o A..:? "query"
        return $ SupergroupMembersFilterMention {message_thread_id = message_thread_id_, query = query_}

      parseSupergroupMembersFilterBots :: A.Value -> T.Parser SupergroupMembersFilter
      parseSupergroupMembersFilterBots = A.withObject "SupergroupMembersFilterBots" $ \_ -> return SupergroupMembersFilterBots
  parseJSON _ = mempty

instance T.ToJSON SupergroupMembersFilter where
  toJSON SupergroupMembersFilterRecent =
    A.object
      [ "@type" A..= T.String "supergroupMembersFilterRecent"
      ]
  toJSON
    SupergroupMembersFilterContacts
      { query = query_
      } =
      A.object
        [ "@type" A..= T.String "supergroupMembersFilterContacts",
          "query" A..= query_
        ]
  toJSON SupergroupMembersFilterAdministrators =
    A.object
      [ "@type" A..= T.String "supergroupMembersFilterAdministrators"
      ]
  toJSON
    SupergroupMembersFilterSearch
      { query = query_
      } =
      A.object
        [ "@type" A..= T.String "supergroupMembersFilterSearch",
          "query" A..= query_
        ]
  toJSON
    SupergroupMembersFilterRestricted
      { query = query_
      } =
      A.object
        [ "@type" A..= T.String "supergroupMembersFilterRestricted",
          "query" A..= query_
        ]
  toJSON
    SupergroupMembersFilterBanned
      { query = query_
      } =
      A.object
        [ "@type" A..= T.String "supergroupMembersFilterBanned",
          "query" A..= query_
        ]
  toJSON
    SupergroupMembersFilterMention
      { message_thread_id = message_thread_id_,
        query = query_
      } =
      A.object
        [ "@type" A..= T.String "supergroupMembersFilterMention",
          "message_thread_id" A..= message_thread_id_,
          "query" A..= query_
        ]
  toJSON SupergroupMembersFilterBots =
    A.object
      [ "@type" A..= T.String "supergroupMembersFilterBots"
      ]
