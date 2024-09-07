module TD.Data.ChatEventLogFilters
  ( ChatEventLogFilters(..)    
  , defaultChatEventLogFilters 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatEventLogFilters
  = ChatEventLogFilters -- ^ Represents a set of filters used to obtain a chat event log
    { message_edits           :: Maybe Bool -- ^ True, if message edits need to be returned
    , message_deletions       :: Maybe Bool -- ^ True, if message deletions need to be returned
    , message_pins            :: Maybe Bool -- ^ True, if pin/unpin events need to be returned
    , member_joins            :: Maybe Bool -- ^ True, if members joining events need to be returned
    , member_leaves           :: Maybe Bool -- ^ True, if members leaving events need to be returned
    , member_invites          :: Maybe Bool -- ^ True, if invited member events need to be returned
    , member_promotions       :: Maybe Bool -- ^ True, if member promotion/demotion events need to be returned
    , member_restrictions     :: Maybe Bool -- ^ True, if member restricted/unrestricted/banned/unbanned events need to be returned
    , info_changes            :: Maybe Bool -- ^ True, if changes in chat information need to be returned
    , setting_changes         :: Maybe Bool -- ^ True, if changes in chat settings need to be returned
    , invite_link_changes     :: Maybe Bool -- ^ True, if changes to invite links need to be returned
    , video_chat_changes      :: Maybe Bool -- ^ True, if video chat actions need to be returned
    , forum_changes           :: Maybe Bool -- ^ True, if forum-related actions need to be returned
    , subscription_extensions :: Maybe Bool -- ^ True, if subscription extensions need to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow ChatEventLogFilters where
  shortShow ChatEventLogFilters
    { message_edits           = message_edits_
    , message_deletions       = message_deletions_
    , message_pins            = message_pins_
    , member_joins            = member_joins_
    , member_leaves           = member_leaves_
    , member_invites          = member_invites_
    , member_promotions       = member_promotions_
    , member_restrictions     = member_restrictions_
    , info_changes            = info_changes_
    , setting_changes         = setting_changes_
    , invite_link_changes     = invite_link_changes_
    , video_chat_changes      = video_chat_changes_
    , forum_changes           = forum_changes_
    , subscription_extensions = subscription_extensions_
    }
      = "ChatEventLogFilters"
        ++ I.cc
        [ "message_edits"           `I.p` message_edits_
        , "message_deletions"       `I.p` message_deletions_
        , "message_pins"            `I.p` message_pins_
        , "member_joins"            `I.p` member_joins_
        , "member_leaves"           `I.p` member_leaves_
        , "member_invites"          `I.p` member_invites_
        , "member_promotions"       `I.p` member_promotions_
        , "member_restrictions"     `I.p` member_restrictions_
        , "info_changes"            `I.p` info_changes_
        , "setting_changes"         `I.p` setting_changes_
        , "invite_link_changes"     `I.p` invite_link_changes_
        , "video_chat_changes"      `I.p` video_chat_changes_
        , "forum_changes"           `I.p` forum_changes_
        , "subscription_extensions" `I.p` subscription_extensions_
        ]

instance AT.FromJSON ChatEventLogFilters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatEventLogFilters" -> parseChatEventLogFilters v
      _                     -> mempty
    
    where
      parseChatEventLogFilters :: A.Value -> AT.Parser ChatEventLogFilters
      parseChatEventLogFilters = A.withObject "ChatEventLogFilters" $ \o -> do
        message_edits_           <- o A..:?  "message_edits"
        message_deletions_       <- o A..:?  "message_deletions"
        message_pins_            <- o A..:?  "message_pins"
        member_joins_            <- o A..:?  "member_joins"
        member_leaves_           <- o A..:?  "member_leaves"
        member_invites_          <- o A..:?  "member_invites"
        member_promotions_       <- o A..:?  "member_promotions"
        member_restrictions_     <- o A..:?  "member_restrictions"
        info_changes_            <- o A..:?  "info_changes"
        setting_changes_         <- o A..:?  "setting_changes"
        invite_link_changes_     <- o A..:?  "invite_link_changes"
        video_chat_changes_      <- o A..:?  "video_chat_changes"
        forum_changes_           <- o A..:?  "forum_changes"
        subscription_extensions_ <- o A..:?  "subscription_extensions"
        pure $ ChatEventLogFilters
          { message_edits           = message_edits_
          , message_deletions       = message_deletions_
          , message_pins            = message_pins_
          , member_joins            = member_joins_
          , member_leaves           = member_leaves_
          , member_invites          = member_invites_
          , member_promotions       = member_promotions_
          , member_restrictions     = member_restrictions_
          , info_changes            = info_changes_
          , setting_changes         = setting_changes_
          , invite_link_changes     = invite_link_changes_
          , video_chat_changes      = video_chat_changes_
          , forum_changes           = forum_changes_
          , subscription_extensions = subscription_extensions_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatEventLogFilters where
  toJSON ChatEventLogFilters
    { message_edits           = message_edits_
    , message_deletions       = message_deletions_
    , message_pins            = message_pins_
    , member_joins            = member_joins_
    , member_leaves           = member_leaves_
    , member_invites          = member_invites_
    , member_promotions       = member_promotions_
    , member_restrictions     = member_restrictions_
    , info_changes            = info_changes_
    , setting_changes         = setting_changes_
    , invite_link_changes     = invite_link_changes_
    , video_chat_changes      = video_chat_changes_
    , forum_changes           = forum_changes_
    , subscription_extensions = subscription_extensions_
    }
      = A.object
        [ "@type"                   A..= AT.String "chatEventLogFilters"
        , "message_edits"           A..= message_edits_
        , "message_deletions"       A..= message_deletions_
        , "message_pins"            A..= message_pins_
        , "member_joins"            A..= member_joins_
        , "member_leaves"           A..= member_leaves_
        , "member_invites"          A..= member_invites_
        , "member_promotions"       A..= member_promotions_
        , "member_restrictions"     A..= member_restrictions_
        , "info_changes"            A..= info_changes_
        , "setting_changes"         A..= setting_changes_
        , "invite_link_changes"     A..= invite_link_changes_
        , "video_chat_changes"      A..= video_chat_changes_
        , "forum_changes"           A..= forum_changes_
        , "subscription_extensions" A..= subscription_extensions_
        ]

defaultChatEventLogFilters :: ChatEventLogFilters
defaultChatEventLogFilters =
  ChatEventLogFilters
    { message_edits           = Nothing
    , message_deletions       = Nothing
    , message_pins            = Nothing
    , member_joins            = Nothing
    , member_leaves           = Nothing
    , member_invites          = Nothing
    , member_promotions       = Nothing
    , member_restrictions     = Nothing
    , info_changes            = Nothing
    , setting_changes         = Nothing
    , invite_link_changes     = Nothing
    , video_chat_changes      = Nothing
    , forum_changes           = Nothing
    , subscription_extensions = Nothing
    }

