{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ForumTopicInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ForumTopicIcon as ForumTopicIcon
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
data ForumTopicInfo = -- | Contains basic information about a forum topic
  ForumTopicInfo
  { -- | True, if the topic is hidden above the topic list and closed; for General topic only
    is_hidden :: Maybe Bool,
    -- | True, if the topic is closed
    is_closed :: Maybe Bool,
    -- | True, if the topic was created by the current user
    is_outgoing :: Maybe Bool,
    -- | True, if the topic is the General topic list
    is_general :: Maybe Bool,
    -- | Identifier of the creator of the topic
    creator_id :: Maybe MessageSender.MessageSender,
    -- | Point in time (Unix timestamp) when the topic was created
    creation_date :: Maybe Int,
    -- | Icon of the topic
    icon :: Maybe ForumTopicIcon.ForumTopicIcon,
    -- | Name of the topic
    name :: Maybe String,
    -- | Message thread identifier of the topic
    message_thread_id :: Maybe Int
  }
  deriving (Eq)

instance Show ForumTopicInfo where
  show
    ForumTopicInfo
      { is_hidden = is_hidden_,
        is_closed = is_closed_,
        is_outgoing = is_outgoing_,
        is_general = is_general_,
        creator_id = creator_id_,
        creation_date = creation_date_,
        icon = icon_,
        name = name_,
        message_thread_id = message_thread_id_
      } =
      "ForumTopicInfo"
        ++ U.cc
          [ U.p "is_hidden" is_hidden_,
            U.p "is_closed" is_closed_,
            U.p "is_outgoing" is_outgoing_,
            U.p "is_general" is_general_,
            U.p "creator_id" creator_id_,
            U.p "creation_date" creation_date_,
            U.p "icon" icon_,
            U.p "name" name_,
            U.p "message_thread_id" message_thread_id_
          ]

instance T.FromJSON ForumTopicInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "forumTopicInfo" -> parseForumTopicInfo v
      _ -> mempty
    where
      parseForumTopicInfo :: A.Value -> T.Parser ForumTopicInfo
      parseForumTopicInfo = A.withObject "ForumTopicInfo" $ \o -> do
        is_hidden_ <- o A..:? "is_hidden"
        is_closed_ <- o A..:? "is_closed"
        is_outgoing_ <- o A..:? "is_outgoing"
        is_general_ <- o A..:? "is_general"
        creator_id_ <- o A..:? "creator_id"
        creation_date_ <- o A..:? "creation_date"
        icon_ <- o A..:? "icon"
        name_ <- o A..:? "name"
        message_thread_id_ <- o A..:? "message_thread_id"
        return $ ForumTopicInfo {is_hidden = is_hidden_, is_closed = is_closed_, is_outgoing = is_outgoing_, is_general = is_general_, creator_id = creator_id_, creation_date = creation_date_, icon = icon_, name = name_, message_thread_id = message_thread_id_}
  parseJSON _ = mempty

instance T.ToJSON ForumTopicInfo where
  toJSON
    ForumTopicInfo
      { is_hidden = is_hidden_,
        is_closed = is_closed_,
        is_outgoing = is_outgoing_,
        is_general = is_general_,
        creator_id = creator_id_,
        creation_date = creation_date_,
        icon = icon_,
        name = name_,
        message_thread_id = message_thread_id_
      } =
      A.object
        [ "@type" A..= T.String "forumTopicInfo",
          "is_hidden" A..= is_hidden_,
          "is_closed" A..= is_closed_,
          "is_outgoing" A..= is_outgoing_,
          "is_general" A..= is_general_,
          "creator_id" A..= creator_id_,
          "creation_date" A..= creation_date_,
          "icon" A..= icon_,
          "name" A..= name_,
          "message_thread_id" A..= message_thread_id_
        ]
