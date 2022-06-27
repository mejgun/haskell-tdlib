{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TargetChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified TD.Data.InternalLinkType as InternalLinkType
import qualified Utils as U

-- | Describes the target chat to be opened
data TargetChat
  = -- | The currently opened chat needs to be kept
    TargetChatCurrent
  | -- | The chat needs to be chosen by the user among chats of the specified types
    TargetChatChosen
      { -- | True, if channel chats are allowed
        allow_channel_chats :: Maybe Bool,
        -- | True, if basic group and supergroup chats are allowed
        allow_group_chats :: Maybe Bool,
        -- | True, if private chats with other bots are allowed
        allow_bot_chats :: Maybe Bool,
        -- | True, if private chats with ordinary users are allowed
        allow_user_chats :: Maybe Bool
      }
  | -- | The chat needs to be open with the provided internal link @link An internal link pointing to the chat
    TargetChatInternalLink
      { -- |
        link :: Maybe InternalLinkType.InternalLinkType
      }
  deriving (Eq)

instance Show TargetChat where
  show TargetChatCurrent =
    "TargetChatCurrent"
      ++ U.cc
        []
  show
    TargetChatChosen
      { allow_channel_chats = allow_channel_chats_,
        allow_group_chats = allow_group_chats_,
        allow_bot_chats = allow_bot_chats_,
        allow_user_chats = allow_user_chats_
      } =
      "TargetChatChosen"
        ++ U.cc
          [ U.p "allow_channel_chats" allow_channel_chats_,
            U.p "allow_group_chats" allow_group_chats_,
            U.p "allow_bot_chats" allow_bot_chats_,
            U.p "allow_user_chats" allow_user_chats_
          ]
  show
    TargetChatInternalLink
      { link = link_
      } =
      "TargetChatInternalLink"
        ++ U.cc
          [ U.p "link" link_
          ]

instance T.FromJSON TargetChat where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "targetChatCurrent" -> parseTargetChatCurrent v
      "targetChatChosen" -> parseTargetChatChosen v
      "targetChatInternalLink" -> parseTargetChatInternalLink v
      _ -> mempty
    where
      parseTargetChatCurrent :: A.Value -> T.Parser TargetChat
      parseTargetChatCurrent = A.withObject "TargetChatCurrent" $ \_ -> return TargetChatCurrent

      parseTargetChatChosen :: A.Value -> T.Parser TargetChat
      parseTargetChatChosen = A.withObject "TargetChatChosen" $ \o -> do
        allow_channel_chats_ <- o A..:? "allow_channel_chats"
        allow_group_chats_ <- o A..:? "allow_group_chats"
        allow_bot_chats_ <- o A..:? "allow_bot_chats"
        allow_user_chats_ <- o A..:? "allow_user_chats"
        return $ TargetChatChosen {allow_channel_chats = allow_channel_chats_, allow_group_chats = allow_group_chats_, allow_bot_chats = allow_bot_chats_, allow_user_chats = allow_user_chats_}

      parseTargetChatInternalLink :: A.Value -> T.Parser TargetChat
      parseTargetChatInternalLink = A.withObject "TargetChatInternalLink" $ \o -> do
        link_ <- o A..:? "link"
        return $ TargetChatInternalLink {link = link_}
  parseJSON _ = mempty

instance T.ToJSON TargetChat where
  toJSON TargetChatCurrent =
    A.object
      [ "@type" A..= T.String "targetChatCurrent"
      ]
  toJSON
    TargetChatChosen
      { allow_channel_chats = allow_channel_chats_,
        allow_group_chats = allow_group_chats_,
        allow_bot_chats = allow_bot_chats_,
        allow_user_chats = allow_user_chats_
      } =
      A.object
        [ "@type" A..= T.String "targetChatChosen",
          "allow_channel_chats" A..= allow_channel_chats_,
          "allow_group_chats" A..= allow_group_chats_,
          "allow_bot_chats" A..= allow_bot_chats_,
          "allow_user_chats" A..= allow_user_chats_
        ]
  toJSON
    TargetChatInternalLink
      { link = link_
      } =
      A.object
        [ "@type" A..= T.String "targetChatInternalLink",
          "link" A..= link_
        ]
