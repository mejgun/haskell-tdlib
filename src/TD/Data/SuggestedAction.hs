module TD.Data.SuggestedAction (SuggestedAction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data SuggestedAction -- ^ Describes an action suggested to the current user
  = SuggestedActionEnableArchiveAndMuteNewChats -- ^ Suggests the user to enable archive_and_mute_new_chats_from_unknown_users setting in archiveChatListSettings
  | SuggestedActionCheckPassword -- ^ Suggests the user to check whether they still remember their 2-step verification password
  | SuggestedActionCheckPhoneNumber -- ^ Suggests the user to check whether authorization phone number is correct and change the phone number if it is inaccessible
  | SuggestedActionViewChecksHint -- ^ Suggests the user to view a hint about the meaning of one and two check marks on sent messages
  | SuggestedActionConvertToBroadcastGroup -- ^ Suggests the user to convert specified supergroup to a broadcast group
    { supergroup_id :: Maybe Int -- ^ Supergroup identifier
    }
  | SuggestedActionSetPassword -- ^ Suggests the user to set a 2-step verification password to be able to log in again
    { authorization_delay :: Maybe Int -- ^ The number of days to pass between consecutive authorizations if the user declines to set password; if 0, then the user is advised to set the password for security reasons
    }
  | SuggestedActionUpgradePremium -- ^ Suggests the user to upgrade the Premium subscription from monthly payments to annual payments
  | SuggestedActionRestorePremium -- ^ Suggests the user to restore a recently expired Premium subscription
  | SuggestedActionSubscribeToAnnualPremium -- ^ Suggests the user to subscribe to the Premium subscription with annual payments
  deriving (Eq)

instance Show SuggestedAction where
  show SuggestedActionEnableArchiveAndMuteNewChats
      = "SuggestedActionEnableArchiveAndMuteNewChats"
  show SuggestedActionCheckPassword
      = "SuggestedActionCheckPassword"
  show SuggestedActionCheckPhoneNumber
      = "SuggestedActionCheckPhoneNumber"
  show SuggestedActionViewChecksHint
      = "SuggestedActionViewChecksHint"
  show SuggestedActionConvertToBroadcastGroup
    { supergroup_id = supergroup_id_
    }
      = "SuggestedActionConvertToBroadcastGroup"
        ++ I.cc
        [ "supergroup_id" `I.p` supergroup_id_
        ]
  show SuggestedActionSetPassword
    { authorization_delay = authorization_delay_
    }
      = "SuggestedActionSetPassword"
        ++ I.cc
        [ "authorization_delay" `I.p` authorization_delay_
        ]
  show SuggestedActionUpgradePremium
      = "SuggestedActionUpgradePremium"
  show SuggestedActionRestorePremium
      = "SuggestedActionRestorePremium"
  show SuggestedActionSubscribeToAnnualPremium
      = "SuggestedActionSubscribeToAnnualPremium"

instance AT.FromJSON SuggestedAction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "suggestedActionEnableArchiveAndMuteNewChats" -> pure SuggestedActionEnableArchiveAndMuteNewChats
      "suggestedActionCheckPassword"                -> pure SuggestedActionCheckPassword
      "suggestedActionCheckPhoneNumber"             -> pure SuggestedActionCheckPhoneNumber
      "suggestedActionViewChecksHint"               -> pure SuggestedActionViewChecksHint
      "suggestedActionConvertToBroadcastGroup"      -> parseSuggestedActionConvertToBroadcastGroup v
      "suggestedActionSetPassword"                  -> parseSuggestedActionSetPassword v
      "suggestedActionUpgradePremium"               -> pure SuggestedActionUpgradePremium
      "suggestedActionRestorePremium"               -> pure SuggestedActionRestorePremium
      "suggestedActionSubscribeToAnnualPremium"     -> pure SuggestedActionSubscribeToAnnualPremium
      _                                             -> mempty
    
    where
      parseSuggestedActionConvertToBroadcastGroup :: A.Value -> AT.Parser SuggestedAction
      parseSuggestedActionConvertToBroadcastGroup = A.withObject "SuggestedActionConvertToBroadcastGroup" $ \o -> do
        supergroup_id_ <- o A..:?  "supergroup_id"
        pure $ SuggestedActionConvertToBroadcastGroup
          { supergroup_id = supergroup_id_
          }
      parseSuggestedActionSetPassword :: A.Value -> AT.Parser SuggestedAction
      parseSuggestedActionSetPassword = A.withObject "SuggestedActionSetPassword" $ \o -> do
        authorization_delay_ <- o A..:?  "authorization_delay"
        pure $ SuggestedActionSetPassword
          { authorization_delay = authorization_delay_
          }
  parseJSON _ = mempty

instance AT.ToJSON SuggestedAction where
  toJSON SuggestedActionEnableArchiveAndMuteNewChats
      = A.object
        [ "@type" A..= AT.String "suggestedActionEnableArchiveAndMuteNewChats"
        ]
  toJSON SuggestedActionCheckPassword
      = A.object
        [ "@type" A..= AT.String "suggestedActionCheckPassword"
        ]
  toJSON SuggestedActionCheckPhoneNumber
      = A.object
        [ "@type" A..= AT.String "suggestedActionCheckPhoneNumber"
        ]
  toJSON SuggestedActionViewChecksHint
      = A.object
        [ "@type" A..= AT.String "suggestedActionViewChecksHint"
        ]
  toJSON SuggestedActionConvertToBroadcastGroup
    { supergroup_id = supergroup_id_
    }
      = A.object
        [ "@type"         A..= AT.String "suggestedActionConvertToBroadcastGroup"
        , "supergroup_id" A..= supergroup_id_
        ]
  toJSON SuggestedActionSetPassword
    { authorization_delay = authorization_delay_
    }
      = A.object
        [ "@type"               A..= AT.String "suggestedActionSetPassword"
        , "authorization_delay" A..= authorization_delay_
        ]
  toJSON SuggestedActionUpgradePremium
      = A.object
        [ "@type" A..= AT.String "suggestedActionUpgradePremium"
        ]
  toJSON SuggestedActionRestorePremium
      = A.object
        [ "@type" A..= AT.String "suggestedActionRestorePremium"
        ]
  toJSON SuggestedActionSubscribeToAnnualPremium
      = A.object
        [ "@type" A..= AT.String "suggestedActionSubscribeToAnnualPremium"
        ]
