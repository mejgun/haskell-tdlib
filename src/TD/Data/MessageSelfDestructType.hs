{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSelfDestructType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes when a message will be self-destructed
data MessageSelfDestructType
  = -- | The message will be self-destructed in the specified time after its content was opened @self_destruct_time The message's self-destruct time, in seconds; must be between 0 and 60 in private chats
    MessageSelfDestructTypeTimer
      { -- |
        self_destruct_time :: Maybe Int
      }
  | -- | The message can be opened only once and will be self-destructed once closed
    MessageSelfDestructTypeImmediately
  deriving (Eq)

instance Show MessageSelfDestructType where
  show
    MessageSelfDestructTypeTimer
      { self_destruct_time = self_destruct_time_
      } =
      "MessageSelfDestructTypeTimer"
        ++ U.cc
          [ U.p "self_destruct_time" self_destruct_time_
          ]
  show MessageSelfDestructTypeImmediately =
    "MessageSelfDestructTypeImmediately"
      ++ U.cc
        []

instance T.FromJSON MessageSelfDestructType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSelfDestructTypeTimer" -> parseMessageSelfDestructTypeTimer v
      "messageSelfDestructTypeImmediately" -> parseMessageSelfDestructTypeImmediately v
      _ -> mempty
    where
      parseMessageSelfDestructTypeTimer :: A.Value -> T.Parser MessageSelfDestructType
      parseMessageSelfDestructTypeTimer = A.withObject "MessageSelfDestructTypeTimer" $ \o -> do
        self_destruct_time_ <- o A..:? "self_destruct_time"
        return $ MessageSelfDestructTypeTimer {self_destruct_time = self_destruct_time_}

      parseMessageSelfDestructTypeImmediately :: A.Value -> T.Parser MessageSelfDestructType
      parseMessageSelfDestructTypeImmediately = A.withObject "MessageSelfDestructTypeImmediately" $ \_ -> return MessageSelfDestructTypeImmediately
  parseJSON _ = mempty

instance T.ToJSON MessageSelfDestructType where
  toJSON
    MessageSelfDestructTypeTimer
      { self_destruct_time = self_destruct_time_
      } =
      A.object
        [ "@type" A..= T.String "messageSelfDestructTypeTimer",
          "self_destruct_time" A..= self_destruct_time_
        ]
  toJSON MessageSelfDestructTypeImmediately =
    A.object
      [ "@type" A..= T.String "messageSelfDestructTypeImmediately"
      ]
