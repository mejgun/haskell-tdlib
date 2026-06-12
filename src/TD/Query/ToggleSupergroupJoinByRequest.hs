module TD.Query.ToggleSupergroupJoinByRequest
  (ToggleSupergroupJoinByRequest(..)
  , defaultToggleSupergroupJoinByRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether all users directly joining the supergroup need to be approved by supergroup administrators; requires can_restrict_members administrator right. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupJoinByRequest
  = ToggleSupergroupJoinByRequest
    { supergroup_id         :: Maybe Int  -- ^ Identifier of the supergroup that isn't a broadcast group and isn't a channel direct message group
    , join_by_request       :: Maybe Bool -- ^ New value of join_by_request
    , guard_bot_user_id     :: Maybe Int  -- ^ Identifier of the bot which will be the guard bot in the group; pass 0 if none; ignored if join_by_request == false. The bot must have administrator privileges and can_invite_users right in the supergroup chat, and must have userTypeBot.is_guard == true
    , apply_to_invite_links :: Maybe Bool -- ^ Pass true to apply the change to the existing invite links, including primary links
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupJoinByRequest where
  shortShow
    ToggleSupergroupJoinByRequest
      { supergroup_id         = supergroup_id_
      , join_by_request       = join_by_request_
      , guard_bot_user_id     = guard_bot_user_id_
      , apply_to_invite_links = apply_to_invite_links_
      }
        = "ToggleSupergroupJoinByRequest"
          ++ I.cc
          [ "supergroup_id"         `I.p` supergroup_id_
          , "join_by_request"       `I.p` join_by_request_
          , "guard_bot_user_id"     `I.p` guard_bot_user_id_
          , "apply_to_invite_links" `I.p` apply_to_invite_links_
          ]

instance AT.ToJSON ToggleSupergroupJoinByRequest where
  toJSON
    ToggleSupergroupJoinByRequest
      { supergroup_id         = supergroup_id_
      , join_by_request       = join_by_request_
      , guard_bot_user_id     = guard_bot_user_id_
      , apply_to_invite_links = apply_to_invite_links_
      }
        = A.object
          [ "@type"                 A..= AT.String "toggleSupergroupJoinByRequest"
          , "supergroup_id"         A..= supergroup_id_
          , "join_by_request"       A..= join_by_request_
          , "guard_bot_user_id"     A..= guard_bot_user_id_
          , "apply_to_invite_links" A..= apply_to_invite_links_
          ]

defaultToggleSupergroupJoinByRequest :: ToggleSupergroupJoinByRequest
defaultToggleSupergroupJoinByRequest =
  ToggleSupergroupJoinByRequest
    { supergroup_id         = Nothing
    , join_by_request       = Nothing
    , guard_bot_user_id     = Nothing
    , apply_to_invite_links = Nothing
    }

