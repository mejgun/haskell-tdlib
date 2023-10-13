module TD.Data.TargetChat
  ( TargetChat(..)                
  , defaultTargetChatChosen       
  , defaultTargetChatInternalLink 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import {-# SOURCE #-} qualified TD.Data.InternalLinkType as InternalLinkType

-- | Describes the target chat to be opened
data TargetChat
  = TargetChatCurrent -- ^ The currently opened chat needs to be kept
  | TargetChatChosen -- ^ The chat needs to be chosen by the user among chats of the specified types
    { allow_user_chats    :: Maybe Bool -- ^ True, if private chats with ordinary users are allowed
    , allow_bot_chats     :: Maybe Bool -- ^ True, if private chats with other bots are allowed
    , allow_group_chats   :: Maybe Bool -- ^ True, if basic group and supergroup chats are allowed
    , allow_channel_chats :: Maybe Bool -- ^ True, if channel chats are allowed
    }
  | TargetChatInternalLink -- ^ The chat needs to be open with the provided internal link
    { link :: Maybe InternalLinkType.InternalLinkType -- ^ An internal link pointing to the chat
    }
  deriving (Eq)

instance Show TargetChat where
  show TargetChatCurrent
      = "TargetChatCurrent"
  show TargetChatChosen
    { allow_user_chats    = allow_user_chats_
    , allow_bot_chats     = allow_bot_chats_
    , allow_group_chats   = allow_group_chats_
    , allow_channel_chats = allow_channel_chats_
    }
      = "TargetChatChosen"
        ++ I.cc
        [ "allow_user_chats"    `I.p` allow_user_chats_
        , "allow_bot_chats"     `I.p` allow_bot_chats_
        , "allow_group_chats"   `I.p` allow_group_chats_
        , "allow_channel_chats" `I.p` allow_channel_chats_
        ]
  show TargetChatInternalLink
    { link = link_
    }
      = "TargetChatInternalLink"
        ++ I.cc
        [ "link" `I.p` link_
        ]

instance AT.FromJSON TargetChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "targetChatCurrent"      -> pure TargetChatCurrent
      "targetChatChosen"       -> parseTargetChatChosen v
      "targetChatInternalLink" -> parseTargetChatInternalLink v
      _                        -> mempty
    
    where
      parseTargetChatChosen :: A.Value -> AT.Parser TargetChat
      parseTargetChatChosen = A.withObject "TargetChatChosen" $ \o -> do
        allow_user_chats_    <- o A..:?  "allow_user_chats"
        allow_bot_chats_     <- o A..:?  "allow_bot_chats"
        allow_group_chats_   <- o A..:?  "allow_group_chats"
        allow_channel_chats_ <- o A..:?  "allow_channel_chats"
        pure $ TargetChatChosen
          { allow_user_chats    = allow_user_chats_
          , allow_bot_chats     = allow_bot_chats_
          , allow_group_chats   = allow_group_chats_
          , allow_channel_chats = allow_channel_chats_
          }
      parseTargetChatInternalLink :: A.Value -> AT.Parser TargetChat
      parseTargetChatInternalLink = A.withObject "TargetChatInternalLink" $ \o -> do
        link_ <- o A..:?  "link"
        pure $ TargetChatInternalLink
          { link = link_
          }
  parseJSON _ = mempty

instance AT.ToJSON TargetChat where
  toJSON TargetChatCurrent
      = A.object
        [ "@type" A..= AT.String "targetChatCurrent"
        ]
  toJSON TargetChatChosen
    { allow_user_chats    = allow_user_chats_
    , allow_bot_chats     = allow_bot_chats_
    , allow_group_chats   = allow_group_chats_
    , allow_channel_chats = allow_channel_chats_
    }
      = A.object
        [ "@type"               A..= AT.String "targetChatChosen"
        , "allow_user_chats"    A..= allow_user_chats_
        , "allow_bot_chats"     A..= allow_bot_chats_
        , "allow_group_chats"   A..= allow_group_chats_
        , "allow_channel_chats" A..= allow_channel_chats_
        ]
  toJSON TargetChatInternalLink
    { link = link_
    }
      = A.object
        [ "@type" A..= AT.String "targetChatInternalLink"
        , "link"  A..= link_
        ]

defaultTargetChatChosen :: TargetChat
defaultTargetChatChosen =
  TargetChatChosen
    { allow_user_chats    = Nothing
    , allow_bot_chats     = Nothing
    , allow_group_chats   = Nothing
    , allow_channel_chats = Nothing
    }

defaultTargetChatInternalLink :: TargetChat
defaultTargetChatInternalLink =
  TargetChatInternalLink
    { link = Nothing
    }

