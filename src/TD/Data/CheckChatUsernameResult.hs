{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CheckChatUsernameResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents result of checking whether a username can be set for a chat
data CheckChatUsernameResult
  = -- | The username can be set
    CheckChatUsernameResultOk
  | -- | The username is invalid
    CheckChatUsernameResultUsernameInvalid
  | -- | The username is occupied
    CheckChatUsernameResultUsernameOccupied
  | -- | The username can be purchased at fragment.com
    CheckChatUsernameResultUsernamePurchasable
  | -- | The user has too many chats with username, one of them must be made private first
    CheckChatUsernameResultPublicChatsTooMany
  | -- | The user can't be a member of a public supergroup
    CheckChatUsernameResultPublicGroupsUnavailable
  deriving (Eq)

instance Show CheckChatUsernameResult where
  show CheckChatUsernameResultOk =
    "CheckChatUsernameResultOk"
      ++ U.cc
        []
  show CheckChatUsernameResultUsernameInvalid =
    "CheckChatUsernameResultUsernameInvalid"
      ++ U.cc
        []
  show CheckChatUsernameResultUsernameOccupied =
    "CheckChatUsernameResultUsernameOccupied"
      ++ U.cc
        []
  show CheckChatUsernameResultUsernamePurchasable =
    "CheckChatUsernameResultUsernamePurchasable"
      ++ U.cc
        []
  show CheckChatUsernameResultPublicChatsTooMany =
    "CheckChatUsernameResultPublicChatsTooMany"
      ++ U.cc
        []
  show CheckChatUsernameResultPublicGroupsUnavailable =
    "CheckChatUsernameResultPublicGroupsUnavailable"
      ++ U.cc
        []

instance T.FromJSON CheckChatUsernameResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "checkChatUsernameResultOk" -> parseCheckChatUsernameResultOk v
      "checkChatUsernameResultUsernameInvalid" -> parseCheckChatUsernameResultUsernameInvalid v
      "checkChatUsernameResultUsernameOccupied" -> parseCheckChatUsernameResultUsernameOccupied v
      "checkChatUsernameResultUsernamePurchasable" -> parseCheckChatUsernameResultUsernamePurchasable v
      "checkChatUsernameResultPublicChatsTooMany" -> parseCheckChatUsernameResultPublicChatsTooMany v
      "checkChatUsernameResultPublicGroupsUnavailable" -> parseCheckChatUsernameResultPublicGroupsUnavailable v
      _ -> mempty
    where
      parseCheckChatUsernameResultOk :: A.Value -> T.Parser CheckChatUsernameResult
      parseCheckChatUsernameResultOk = A.withObject "CheckChatUsernameResultOk" $ \_ -> return CheckChatUsernameResultOk

      parseCheckChatUsernameResultUsernameInvalid :: A.Value -> T.Parser CheckChatUsernameResult
      parseCheckChatUsernameResultUsernameInvalid = A.withObject "CheckChatUsernameResultUsernameInvalid" $ \_ -> return CheckChatUsernameResultUsernameInvalid

      parseCheckChatUsernameResultUsernameOccupied :: A.Value -> T.Parser CheckChatUsernameResult
      parseCheckChatUsernameResultUsernameOccupied = A.withObject "CheckChatUsernameResultUsernameOccupied" $ \_ -> return CheckChatUsernameResultUsernameOccupied

      parseCheckChatUsernameResultUsernamePurchasable :: A.Value -> T.Parser CheckChatUsernameResult
      parseCheckChatUsernameResultUsernamePurchasable = A.withObject "CheckChatUsernameResultUsernamePurchasable" $ \_ -> return CheckChatUsernameResultUsernamePurchasable

      parseCheckChatUsernameResultPublicChatsTooMany :: A.Value -> T.Parser CheckChatUsernameResult
      parseCheckChatUsernameResultPublicChatsTooMany = A.withObject "CheckChatUsernameResultPublicChatsTooMany" $ \_ -> return CheckChatUsernameResultPublicChatsTooMany

      parseCheckChatUsernameResultPublicGroupsUnavailable :: A.Value -> T.Parser CheckChatUsernameResult
      parseCheckChatUsernameResultPublicGroupsUnavailable = A.withObject "CheckChatUsernameResultPublicGroupsUnavailable" $ \_ -> return CheckChatUsernameResultPublicGroupsUnavailable
  parseJSON _ = mempty

instance T.ToJSON CheckChatUsernameResult where
  toJSON CheckChatUsernameResultOk =
    A.object
      [ "@type" A..= T.String "checkChatUsernameResultOk"
      ]
  toJSON CheckChatUsernameResultUsernameInvalid =
    A.object
      [ "@type" A..= T.String "checkChatUsernameResultUsernameInvalid"
      ]
  toJSON CheckChatUsernameResultUsernameOccupied =
    A.object
      [ "@type" A..= T.String "checkChatUsernameResultUsernameOccupied"
      ]
  toJSON CheckChatUsernameResultUsernamePurchasable =
    A.object
      [ "@type" A..= T.String "checkChatUsernameResultUsernamePurchasable"
      ]
  toJSON CheckChatUsernameResultPublicChatsTooMany =
    A.object
      [ "@type" A..= T.String "checkChatUsernameResultPublicChatsTooMany"
      ]
  toJSON CheckChatUsernameResultPublicGroupsUnavailable =
    A.object
      [ "@type" A..= T.String "checkChatUsernameResultPublicGroupsUnavailable"
      ]
