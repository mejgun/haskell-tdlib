module TD.Data.BotAccessSettings
  ( BotAccessSettings(..)    
  , defaultBotAccessSettings 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data BotAccessSettings
  = BotAccessSettings -- ^ Describes users that have access to a bot
    { is_restricted  :: Maybe Bool  -- ^ True, if access to the bot is restricted to its owner and selected users
    , added_user_ids :: Maybe [Int] -- ^ Identifiers of the users who can use the bot additionally to the owner of the bot
    }
  deriving (Eq, Show)

instance I.ShortShow BotAccessSettings where
  shortShow BotAccessSettings
    { is_restricted  = is_restricted_
    , added_user_ids = added_user_ids_
    }
      = "BotAccessSettings"
        ++ I.cc
        [ "is_restricted"  `I.p` is_restricted_
        , "added_user_ids" `I.p` added_user_ids_
        ]

instance AT.FromJSON BotAccessSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botAccessSettings" -> parseBotAccessSettings v
      _                   -> mempty
    
    where
      parseBotAccessSettings :: A.Value -> AT.Parser BotAccessSettings
      parseBotAccessSettings = A.withObject "BotAccessSettings" $ \o -> do
        is_restricted_  <- o A..:?  "is_restricted"
        added_user_ids_ <- o A..:?  "added_user_ids"
        pure $ BotAccessSettings
          { is_restricted  = is_restricted_
          , added_user_ids = added_user_ids_
          }
  parseJSON _ = mempty

instance AT.ToJSON BotAccessSettings where
  toJSON BotAccessSettings
    { is_restricted  = is_restricted_
    , added_user_ids = added_user_ids_
    }
      = A.object
        [ "@type"          A..= AT.String "botAccessSettings"
        , "is_restricted"  A..= is_restricted_
        , "added_user_ids" A..= added_user_ids_
        ]

defaultBotAccessSettings :: BotAccessSettings
defaultBotAccessSettings =
  BotAccessSettings
    { is_restricted  = Nothing
    , added_user_ids = Nothing
    }

