module TD.Data.TargetChatTypes
  ( TargetChatTypes(..)    
  , defaultTargetChatTypes 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data TargetChatTypes
  = TargetChatTypes -- ^ Describes allowed types for the target chat
    { allow_user_chats    :: Maybe Bool -- ^ True, if private chats with ordinary users are allowed
    , allow_bot_chats     :: Maybe Bool -- ^ True, if private chats with other bots are allowed
    , allow_group_chats   :: Maybe Bool -- ^ True, if basic group and supergroup chats are allowed
    , allow_channel_chats :: Maybe Bool -- ^ True, if channel chats are allowed
    }
  deriving (Eq, Show)

instance I.ShortShow TargetChatTypes where
  shortShow TargetChatTypes
    { allow_user_chats    = allow_user_chats_
    , allow_bot_chats     = allow_bot_chats_
    , allow_group_chats   = allow_group_chats_
    , allow_channel_chats = allow_channel_chats_
    }
      = "TargetChatTypes"
        ++ I.cc
        [ "allow_user_chats"    `I.p` allow_user_chats_
        , "allow_bot_chats"     `I.p` allow_bot_chats_
        , "allow_group_chats"   `I.p` allow_group_chats_
        , "allow_channel_chats" `I.p` allow_channel_chats_
        ]

instance AT.FromJSON TargetChatTypes where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "targetChatTypes" -> parseTargetChatTypes v
      _                 -> mempty
    
    where
      parseTargetChatTypes :: A.Value -> AT.Parser TargetChatTypes
      parseTargetChatTypes = A.withObject "TargetChatTypes" $ \o -> do
        allow_user_chats_    <- o A..:?  "allow_user_chats"
        allow_bot_chats_     <- o A..:?  "allow_bot_chats"
        allow_group_chats_   <- o A..:?  "allow_group_chats"
        allow_channel_chats_ <- o A..:?  "allow_channel_chats"
        pure $ TargetChatTypes
          { allow_user_chats    = allow_user_chats_
          , allow_bot_chats     = allow_bot_chats_
          , allow_group_chats   = allow_group_chats_
          , allow_channel_chats = allow_channel_chats_
          }
  parseJSON _ = mempty

instance AT.ToJSON TargetChatTypes where
  toJSON TargetChatTypes
    { allow_user_chats    = allow_user_chats_
    , allow_bot_chats     = allow_bot_chats_
    , allow_group_chats   = allow_group_chats_
    , allow_channel_chats = allow_channel_chats_
    }
      = A.object
        [ "@type"               A..= AT.String "targetChatTypes"
        , "allow_user_chats"    A..= allow_user_chats_
        , "allow_bot_chats"     A..= allow_bot_chats_
        , "allow_group_chats"   A..= allow_group_chats_
        , "allow_channel_chats" A..= allow_channel_chats_
        ]

defaultTargetChatTypes :: TargetChatTypes
defaultTargetChatTypes =
  TargetChatTypes
    { allow_user_chats    = Nothing
    , allow_bot_chats     = Nothing
    , allow_group_chats   = Nothing
    , allow_channel_chats = Nothing
    }

