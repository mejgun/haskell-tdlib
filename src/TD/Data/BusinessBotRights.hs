module TD.Data.BusinessBotRights
  ( BusinessBotRights(..)    
  , defaultBusinessBotRights 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data BusinessBotRights
  = BusinessBotRights -- ^ Describes rights of a business bot
    { can_reply                      :: Maybe Bool -- ^ True, if the bot can send and edit messages in the private chats that had incoming messages in the last 24 hours
    , can_read_messages              :: Maybe Bool -- ^ True, if the bot can mark incoming private messages as read
    , can_delete_sent_messages       :: Maybe Bool -- ^ True, if the bot can delete sent messages
    , can_delete_all_messages        :: Maybe Bool -- ^ True, if the bot can delete any message
    , can_edit_name                  :: Maybe Bool -- ^ True, if the bot can edit name of the business account
    , can_edit_bio                   :: Maybe Bool -- ^ True, if the bot can edit bio of the business account
    , can_edit_profile_photo         :: Maybe Bool -- ^ True, if the bot can edit profile photo of the business account
    , can_edit_username              :: Maybe Bool -- ^ True, if the bot can edit username of the business account
    , can_view_gifts_and_stars       :: Maybe Bool -- ^ True, if the bot can view gifts and amount of Telegram Stars owned by the business account
    , can_sell_gifts                 :: Maybe Bool -- ^ True, if the bot can sell regular gifts received by the business account
    , can_change_gift_settings       :: Maybe Bool -- ^ True, if the bot can change gift receiving settings of the business account
    , can_transfer_and_upgrade_gifts :: Maybe Bool -- ^ True, if the bot can transfer and upgrade gifts received by the business account
    , can_transfer_stars             :: Maybe Bool -- ^ True, if the bot can transfer Telegram Stars received by the business account to account of the bot, or use them to upgrade and transfer gifts
    , can_manage_stories             :: Maybe Bool -- ^ True, if the bot can send, edit and delete stories
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessBotRights where
  shortShow BusinessBotRights
    { can_reply                      = can_reply_
    , can_read_messages              = can_read_messages_
    , can_delete_sent_messages       = can_delete_sent_messages_
    , can_delete_all_messages        = can_delete_all_messages_
    , can_edit_name                  = can_edit_name_
    , can_edit_bio                   = can_edit_bio_
    , can_edit_profile_photo         = can_edit_profile_photo_
    , can_edit_username              = can_edit_username_
    , can_view_gifts_and_stars       = can_view_gifts_and_stars_
    , can_sell_gifts                 = can_sell_gifts_
    , can_change_gift_settings       = can_change_gift_settings_
    , can_transfer_and_upgrade_gifts = can_transfer_and_upgrade_gifts_
    , can_transfer_stars             = can_transfer_stars_
    , can_manage_stories             = can_manage_stories_
    }
      = "BusinessBotRights"
        ++ I.cc
        [ "can_reply"                      `I.p` can_reply_
        , "can_read_messages"              `I.p` can_read_messages_
        , "can_delete_sent_messages"       `I.p` can_delete_sent_messages_
        , "can_delete_all_messages"        `I.p` can_delete_all_messages_
        , "can_edit_name"                  `I.p` can_edit_name_
        , "can_edit_bio"                   `I.p` can_edit_bio_
        , "can_edit_profile_photo"         `I.p` can_edit_profile_photo_
        , "can_edit_username"              `I.p` can_edit_username_
        , "can_view_gifts_and_stars"       `I.p` can_view_gifts_and_stars_
        , "can_sell_gifts"                 `I.p` can_sell_gifts_
        , "can_change_gift_settings"       `I.p` can_change_gift_settings_
        , "can_transfer_and_upgrade_gifts" `I.p` can_transfer_and_upgrade_gifts_
        , "can_transfer_stars"             `I.p` can_transfer_stars_
        , "can_manage_stories"             `I.p` can_manage_stories_
        ]

instance AT.FromJSON BusinessBotRights where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessBotRights" -> parseBusinessBotRights v
      _                   -> mempty
    
    where
      parseBusinessBotRights :: A.Value -> AT.Parser BusinessBotRights
      parseBusinessBotRights = A.withObject "BusinessBotRights" $ \o -> do
        can_reply_                      <- o A..:?  "can_reply"
        can_read_messages_              <- o A..:?  "can_read_messages"
        can_delete_sent_messages_       <- o A..:?  "can_delete_sent_messages"
        can_delete_all_messages_        <- o A..:?  "can_delete_all_messages"
        can_edit_name_                  <- o A..:?  "can_edit_name"
        can_edit_bio_                   <- o A..:?  "can_edit_bio"
        can_edit_profile_photo_         <- o A..:?  "can_edit_profile_photo"
        can_edit_username_              <- o A..:?  "can_edit_username"
        can_view_gifts_and_stars_       <- o A..:?  "can_view_gifts_and_stars"
        can_sell_gifts_                 <- o A..:?  "can_sell_gifts"
        can_change_gift_settings_       <- o A..:?  "can_change_gift_settings"
        can_transfer_and_upgrade_gifts_ <- o A..:?  "can_transfer_and_upgrade_gifts"
        can_transfer_stars_             <- o A..:?  "can_transfer_stars"
        can_manage_stories_             <- o A..:?  "can_manage_stories"
        pure $ BusinessBotRights
          { can_reply                      = can_reply_
          , can_read_messages              = can_read_messages_
          , can_delete_sent_messages       = can_delete_sent_messages_
          , can_delete_all_messages        = can_delete_all_messages_
          , can_edit_name                  = can_edit_name_
          , can_edit_bio                   = can_edit_bio_
          , can_edit_profile_photo         = can_edit_profile_photo_
          , can_edit_username              = can_edit_username_
          , can_view_gifts_and_stars       = can_view_gifts_and_stars_
          , can_sell_gifts                 = can_sell_gifts_
          , can_change_gift_settings       = can_change_gift_settings_
          , can_transfer_and_upgrade_gifts = can_transfer_and_upgrade_gifts_
          , can_transfer_stars             = can_transfer_stars_
          , can_manage_stories             = can_manage_stories_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessBotRights where
  toJSON BusinessBotRights
    { can_reply                      = can_reply_
    , can_read_messages              = can_read_messages_
    , can_delete_sent_messages       = can_delete_sent_messages_
    , can_delete_all_messages        = can_delete_all_messages_
    , can_edit_name                  = can_edit_name_
    , can_edit_bio                   = can_edit_bio_
    , can_edit_profile_photo         = can_edit_profile_photo_
    , can_edit_username              = can_edit_username_
    , can_view_gifts_and_stars       = can_view_gifts_and_stars_
    , can_sell_gifts                 = can_sell_gifts_
    , can_change_gift_settings       = can_change_gift_settings_
    , can_transfer_and_upgrade_gifts = can_transfer_and_upgrade_gifts_
    , can_transfer_stars             = can_transfer_stars_
    , can_manage_stories             = can_manage_stories_
    }
      = A.object
        [ "@type"                          A..= AT.String "businessBotRights"
        , "can_reply"                      A..= can_reply_
        , "can_read_messages"              A..= can_read_messages_
        , "can_delete_sent_messages"       A..= can_delete_sent_messages_
        , "can_delete_all_messages"        A..= can_delete_all_messages_
        , "can_edit_name"                  A..= can_edit_name_
        , "can_edit_bio"                   A..= can_edit_bio_
        , "can_edit_profile_photo"         A..= can_edit_profile_photo_
        , "can_edit_username"              A..= can_edit_username_
        , "can_view_gifts_and_stars"       A..= can_view_gifts_and_stars_
        , "can_sell_gifts"                 A..= can_sell_gifts_
        , "can_change_gift_settings"       A..= can_change_gift_settings_
        , "can_transfer_and_upgrade_gifts" A..= can_transfer_and_upgrade_gifts_
        , "can_transfer_stars"             A..= can_transfer_stars_
        , "can_manage_stories"             A..= can_manage_stories_
        ]

defaultBusinessBotRights :: BusinessBotRights
defaultBusinessBotRights =
  BusinessBotRights
    { can_reply                      = Nothing
    , can_read_messages              = Nothing
    , can_delete_sent_messages       = Nothing
    , can_delete_all_messages        = Nothing
    , can_edit_name                  = Nothing
    , can_edit_bio                   = Nothing
    , can_edit_profile_photo         = Nothing
    , can_edit_username              = Nothing
    , can_view_gifts_and_stars       = Nothing
    , can_sell_gifts                 = Nothing
    , can_change_gift_settings       = Nothing
    , can_transfer_and_upgrade_gifts = Nothing
    , can_transfer_stars             = Nothing
    , can_manage_stories             = Nothing
    }

