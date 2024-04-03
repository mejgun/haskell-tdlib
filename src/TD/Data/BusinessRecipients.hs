module TD.Data.BusinessRecipients
  ( BusinessRecipients(..)    
  , defaultBusinessRecipients 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data BusinessRecipients
  = BusinessRecipients -- ^ Describes private chats chosen for automatic interaction with a business
    { chat_ids              :: Maybe [Int] -- ^ Identifiers of selected private chats
    , excluded_chat_ids     :: Maybe [Int] -- ^ Identifiers of private chats that are always excluded; for businessConnectedBot only
    , select_existing_chats :: Maybe Bool  -- ^ True, if all existing private chats are selected
    , select_new_chats      :: Maybe Bool  -- ^ True, if all new private chats are selected
    , select_contacts       :: Maybe Bool  -- ^ True, if all private chats with contacts are selected
    , select_non_contacts   :: Maybe Bool  -- ^ True, if all private chats with non-contacts are selected
    , exclude_selected      :: Maybe Bool  -- ^ If true, then all private chats except the selected are chosen. Otherwise, only the selected chats are chosen
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessRecipients where
  shortShow BusinessRecipients
    { chat_ids              = chat_ids_
    , excluded_chat_ids     = excluded_chat_ids_
    , select_existing_chats = select_existing_chats_
    , select_new_chats      = select_new_chats_
    , select_contacts       = select_contacts_
    , select_non_contacts   = select_non_contacts_
    , exclude_selected      = exclude_selected_
    }
      = "BusinessRecipients"
        ++ I.cc
        [ "chat_ids"              `I.p` chat_ids_
        , "excluded_chat_ids"     `I.p` excluded_chat_ids_
        , "select_existing_chats" `I.p` select_existing_chats_
        , "select_new_chats"      `I.p` select_new_chats_
        , "select_contacts"       `I.p` select_contacts_
        , "select_non_contacts"   `I.p` select_non_contacts_
        , "exclude_selected"      `I.p` exclude_selected_
        ]

instance AT.FromJSON BusinessRecipients where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessRecipients" -> parseBusinessRecipients v
      _                    -> mempty
    
    where
      parseBusinessRecipients :: A.Value -> AT.Parser BusinessRecipients
      parseBusinessRecipients = A.withObject "BusinessRecipients" $ \o -> do
        chat_ids_              <- o A..:?  "chat_ids"
        excluded_chat_ids_     <- o A..:?  "excluded_chat_ids"
        select_existing_chats_ <- o A..:?  "select_existing_chats"
        select_new_chats_      <- o A..:?  "select_new_chats"
        select_contacts_       <- o A..:?  "select_contacts"
        select_non_contacts_   <- o A..:?  "select_non_contacts"
        exclude_selected_      <- o A..:?  "exclude_selected"
        pure $ BusinessRecipients
          { chat_ids              = chat_ids_
          , excluded_chat_ids     = excluded_chat_ids_
          , select_existing_chats = select_existing_chats_
          , select_new_chats      = select_new_chats_
          , select_contacts       = select_contacts_
          , select_non_contacts   = select_non_contacts_
          , exclude_selected      = exclude_selected_
          }
  parseJSON _ = mempty

instance AT.ToJSON BusinessRecipients where
  toJSON BusinessRecipients
    { chat_ids              = chat_ids_
    , excluded_chat_ids     = excluded_chat_ids_
    , select_existing_chats = select_existing_chats_
    , select_new_chats      = select_new_chats_
    , select_contacts       = select_contacts_
    , select_non_contacts   = select_non_contacts_
    , exclude_selected      = exclude_selected_
    }
      = A.object
        [ "@type"                 A..= AT.String "businessRecipients"
        , "chat_ids"              A..= chat_ids_
        , "excluded_chat_ids"     A..= excluded_chat_ids_
        , "select_existing_chats" A..= select_existing_chats_
        , "select_new_chats"      A..= select_new_chats_
        , "select_contacts"       A..= select_contacts_
        , "select_non_contacts"   A..= select_non_contacts_
        , "exclude_selected"      A..= exclude_selected_
        ]

defaultBusinessRecipients :: BusinessRecipients
defaultBusinessRecipients =
  BusinessRecipients
    { chat_ids              = Nothing
    , excluded_chat_ids     = Nothing
    , select_existing_chats = Nothing
    , select_new_chats      = Nothing
    , select_contacts       = Nothing
    , select_non_contacts   = Nothing
    , exclude_selected      = Nothing
    }

