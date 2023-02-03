{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SuggestedAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes an action suggested to the current user
data SuggestedAction
  = -- | Suggests the user to enable "archive_and_mute_new_chats_from_unknown_users" option
    SuggestedActionEnableArchiveAndMuteNewChats
  | -- | Suggests the user to check whether they still remember their 2-step verification password
    SuggestedActionCheckPassword
  | -- | Suggests the user to check whether authorization phone number is correct and change the phone number if it is inaccessible
    SuggestedActionCheckPhoneNumber
  | -- | Suggests the user to view a hint about the meaning of one and two check marks on sent messages
    SuggestedActionViewChecksHint
  | -- | Suggests the user to convert specified supergroup to a broadcast group @supergroup_id Supergroup identifier
    SuggestedActionConvertToBroadcastGroup
      { -- |
        supergroup_id :: Maybe Int
      }
  | -- | Suggests the user to set a 2-step verification password to be able to log in again
    SuggestedActionSetPassword
      { -- | The number of days to pass between consecutive authorizations if the user declines to set password; if 0, then the user is advised to set the password for security reasons
        authorization_delay :: Maybe Int
      }
  | -- | Suggests the user to upgrade the Premium subscription from monthly payments to annual payments
    SuggestedActionUpgradePremium
  | -- | Suggests the user to subscribe to the Premium subscription with annual payments
    SuggestedActionSubscribeToAnnualPremium
  deriving (Eq)

instance Show SuggestedAction where
  show SuggestedActionEnableArchiveAndMuteNewChats =
    "SuggestedActionEnableArchiveAndMuteNewChats"
      ++ U.cc
        []
  show SuggestedActionCheckPassword =
    "SuggestedActionCheckPassword"
      ++ U.cc
        []
  show SuggestedActionCheckPhoneNumber =
    "SuggestedActionCheckPhoneNumber"
      ++ U.cc
        []
  show SuggestedActionViewChecksHint =
    "SuggestedActionViewChecksHint"
      ++ U.cc
        []
  show
    SuggestedActionConvertToBroadcastGroup
      { supergroup_id = supergroup_id_
      } =
      "SuggestedActionConvertToBroadcastGroup"
        ++ U.cc
          [ U.p "supergroup_id" supergroup_id_
          ]
  show
    SuggestedActionSetPassword
      { authorization_delay = authorization_delay_
      } =
      "SuggestedActionSetPassword"
        ++ U.cc
          [ U.p "authorization_delay" authorization_delay_
          ]
  show SuggestedActionUpgradePremium =
    "SuggestedActionUpgradePremium"
      ++ U.cc
        []
  show SuggestedActionSubscribeToAnnualPremium =
    "SuggestedActionSubscribeToAnnualPremium"
      ++ U.cc
        []

instance T.FromJSON SuggestedAction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "suggestedActionEnableArchiveAndMuteNewChats" -> parseSuggestedActionEnableArchiveAndMuteNewChats v
      "suggestedActionCheckPassword" -> parseSuggestedActionCheckPassword v
      "suggestedActionCheckPhoneNumber" -> parseSuggestedActionCheckPhoneNumber v
      "suggestedActionViewChecksHint" -> parseSuggestedActionViewChecksHint v
      "suggestedActionConvertToBroadcastGroup" -> parseSuggestedActionConvertToBroadcastGroup v
      "suggestedActionSetPassword" -> parseSuggestedActionSetPassword v
      "suggestedActionUpgradePremium" -> parseSuggestedActionUpgradePremium v
      "suggestedActionSubscribeToAnnualPremium" -> parseSuggestedActionSubscribeToAnnualPremium v
      _ -> mempty
    where
      parseSuggestedActionEnableArchiveAndMuteNewChats :: A.Value -> T.Parser SuggestedAction
      parseSuggestedActionEnableArchiveAndMuteNewChats = A.withObject "SuggestedActionEnableArchiveAndMuteNewChats" $ \_ -> return SuggestedActionEnableArchiveAndMuteNewChats

      parseSuggestedActionCheckPassword :: A.Value -> T.Parser SuggestedAction
      parseSuggestedActionCheckPassword = A.withObject "SuggestedActionCheckPassword" $ \_ -> return SuggestedActionCheckPassword

      parseSuggestedActionCheckPhoneNumber :: A.Value -> T.Parser SuggestedAction
      parseSuggestedActionCheckPhoneNumber = A.withObject "SuggestedActionCheckPhoneNumber" $ \_ -> return SuggestedActionCheckPhoneNumber

      parseSuggestedActionViewChecksHint :: A.Value -> T.Parser SuggestedAction
      parseSuggestedActionViewChecksHint = A.withObject "SuggestedActionViewChecksHint" $ \_ -> return SuggestedActionViewChecksHint

      parseSuggestedActionConvertToBroadcastGroup :: A.Value -> T.Parser SuggestedAction
      parseSuggestedActionConvertToBroadcastGroup = A.withObject "SuggestedActionConvertToBroadcastGroup" $ \o -> do
        supergroup_id_ <- o A..:? "supergroup_id"
        return $ SuggestedActionConvertToBroadcastGroup {supergroup_id = supergroup_id_}

      parseSuggestedActionSetPassword :: A.Value -> T.Parser SuggestedAction
      parseSuggestedActionSetPassword = A.withObject "SuggestedActionSetPassword" $ \o -> do
        authorization_delay_ <- o A..:? "authorization_delay"
        return $ SuggestedActionSetPassword {authorization_delay = authorization_delay_}

      parseSuggestedActionUpgradePremium :: A.Value -> T.Parser SuggestedAction
      parseSuggestedActionUpgradePremium = A.withObject "SuggestedActionUpgradePremium" $ \_ -> return SuggestedActionUpgradePremium

      parseSuggestedActionSubscribeToAnnualPremium :: A.Value -> T.Parser SuggestedAction
      parseSuggestedActionSubscribeToAnnualPremium = A.withObject "SuggestedActionSubscribeToAnnualPremium" $ \_ -> return SuggestedActionSubscribeToAnnualPremium
  parseJSON _ = mempty

instance T.ToJSON SuggestedAction where
  toJSON SuggestedActionEnableArchiveAndMuteNewChats =
    A.object
      [ "@type" A..= T.String "suggestedActionEnableArchiveAndMuteNewChats"
      ]
  toJSON SuggestedActionCheckPassword =
    A.object
      [ "@type" A..= T.String "suggestedActionCheckPassword"
      ]
  toJSON SuggestedActionCheckPhoneNumber =
    A.object
      [ "@type" A..= T.String "suggestedActionCheckPhoneNumber"
      ]
  toJSON SuggestedActionViewChecksHint =
    A.object
      [ "@type" A..= T.String "suggestedActionViewChecksHint"
      ]
  toJSON
    SuggestedActionConvertToBroadcastGroup
      { supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "suggestedActionConvertToBroadcastGroup",
          "supergroup_id" A..= supergroup_id_
        ]
  toJSON
    SuggestedActionSetPassword
      { authorization_delay = authorization_delay_
      } =
      A.object
        [ "@type" A..= T.String "suggestedActionSetPassword",
          "authorization_delay" A..= authorization_delay_
        ]
  toJSON SuggestedActionUpgradePremium =
    A.object
      [ "@type" A..= T.String "suggestedActionUpgradePremium"
      ]
  toJSON SuggestedActionSubscribeToAnnualPremium =
    A.object
      [ "@type" A..= T.String "suggestedActionSubscribeToAnnualPremium"
      ]
