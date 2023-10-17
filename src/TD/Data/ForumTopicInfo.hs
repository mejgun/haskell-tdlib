module TD.Data.ForumTopicInfo
  (ForumTopicInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ForumTopicIcon as ForumTopicIcon
import qualified TD.Data.MessageSender as MessageSender

data ForumTopicInfo
  = ForumTopicInfo -- ^ Contains basic information about a forum topic
    { message_thread_id :: Maybe Int                           -- ^ Message thread identifier of the topic
    , name              :: Maybe T.Text                        -- ^ Name of the topic
    , icon              :: Maybe ForumTopicIcon.ForumTopicIcon -- ^ Icon of the topic
    , creation_date     :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the topic was created
    , creator_id        :: Maybe MessageSender.MessageSender   -- ^ Identifier of the creator of the topic
    , is_general        :: Maybe Bool                          -- ^ True, if the topic is the General topic list
    , is_outgoing       :: Maybe Bool                          -- ^ True, if the topic was created by the current user
    , is_closed         :: Maybe Bool                          -- ^ True, if the topic is closed
    , is_hidden         :: Maybe Bool                          -- ^ True, if the topic is hidden above the topic list and closed; for General topic only
    }
  deriving (Eq, Show)

instance I.ShortShow ForumTopicInfo where
  shortShow ForumTopicInfo
    { message_thread_id = message_thread_id_
    , name              = name_
    , icon              = icon_
    , creation_date     = creation_date_
    , creator_id        = creator_id_
    , is_general        = is_general_
    , is_outgoing       = is_outgoing_
    , is_closed         = is_closed_
    , is_hidden         = is_hidden_
    }
      = "ForumTopicInfo"
        ++ I.cc
        [ "message_thread_id" `I.p` message_thread_id_
        , "name"              `I.p` name_
        , "icon"              `I.p` icon_
        , "creation_date"     `I.p` creation_date_
        , "creator_id"        `I.p` creator_id_
        , "is_general"        `I.p` is_general_
        , "is_outgoing"       `I.p` is_outgoing_
        , "is_closed"         `I.p` is_closed_
        , "is_hidden"         `I.p` is_hidden_
        ]

instance AT.FromJSON ForumTopicInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "forumTopicInfo" -> parseForumTopicInfo v
      _                -> mempty
    
    where
      parseForumTopicInfo :: A.Value -> AT.Parser ForumTopicInfo
      parseForumTopicInfo = A.withObject "ForumTopicInfo" $ \o -> do
        message_thread_id_ <- o A..:?  "message_thread_id"
        name_              <- o A..:?  "name"
        icon_              <- o A..:?  "icon"
        creation_date_     <- o A..:?  "creation_date"
        creator_id_        <- o A..:?  "creator_id"
        is_general_        <- o A..:?  "is_general"
        is_outgoing_       <- o A..:?  "is_outgoing"
        is_closed_         <- o A..:?  "is_closed"
        is_hidden_         <- o A..:?  "is_hidden"
        pure $ ForumTopicInfo
          { message_thread_id = message_thread_id_
          , name              = name_
          , icon              = icon_
          , creation_date     = creation_date_
          , creator_id        = creator_id_
          , is_general        = is_general_
          , is_outgoing       = is_outgoing_
          , is_closed         = is_closed_
          , is_hidden         = is_hidden_
          }
  parseJSON _ = mempty

