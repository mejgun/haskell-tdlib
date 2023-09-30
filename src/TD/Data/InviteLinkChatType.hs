{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InviteLinkChatType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the type of a chat to which points an invite link
data InviteLinkChatType
  = -- | The link is an invite link for a basic group
    InviteLinkChatTypeBasicGroup
  | -- | The link is an invite link for a supergroup
    InviteLinkChatTypeSupergroup
  | -- | The link is an invite link for a channel
    InviteLinkChatTypeChannel
  deriving (Eq)

instance Show InviteLinkChatType where
  show InviteLinkChatTypeBasicGroup =
    "InviteLinkChatTypeBasicGroup"
      ++ U.cc
        []
  show InviteLinkChatTypeSupergroup =
    "InviteLinkChatTypeSupergroup"
      ++ U.cc
        []
  show InviteLinkChatTypeChannel =
    "InviteLinkChatTypeChannel"
      ++ U.cc
        []

instance T.FromJSON InviteLinkChatType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inviteLinkChatTypeBasicGroup" -> parseInviteLinkChatTypeBasicGroup v
      "inviteLinkChatTypeSupergroup" -> parseInviteLinkChatTypeSupergroup v
      "inviteLinkChatTypeChannel" -> parseInviteLinkChatTypeChannel v
      _ -> mempty
    where
      parseInviteLinkChatTypeBasicGroup :: A.Value -> T.Parser InviteLinkChatType
      parseInviteLinkChatTypeBasicGroup = A.withObject "InviteLinkChatTypeBasicGroup" $ \_ -> return InviteLinkChatTypeBasicGroup

      parseInviteLinkChatTypeSupergroup :: A.Value -> T.Parser InviteLinkChatType
      parseInviteLinkChatTypeSupergroup = A.withObject "InviteLinkChatTypeSupergroup" $ \_ -> return InviteLinkChatTypeSupergroup

      parseInviteLinkChatTypeChannel :: A.Value -> T.Parser InviteLinkChatType
      parseInviteLinkChatTypeChannel = A.withObject "InviteLinkChatTypeChannel" $ \_ -> return InviteLinkChatTypeChannel
  parseJSON _ = mempty

instance T.ToJSON InviteLinkChatType where
  toJSON InviteLinkChatTypeBasicGroup =
    A.object
      [ "@type" A..= T.String "inviteLinkChatTypeBasicGroup"
      ]
  toJSON InviteLinkChatTypeSupergroup =
    A.object
      [ "@type" A..= T.String "inviteLinkChatTypeSupergroup"
      ]
  toJSON InviteLinkChatTypeChannel =
    A.object
      [ "@type" A..= T.String "inviteLinkChatTypeChannel"
      ]
