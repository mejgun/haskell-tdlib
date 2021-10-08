-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SecretChatState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes the current secret chat state
data SecretChatState = 
 -- |
 -- 
 -- The secret chat is not yet created; waiting for the other user to get online
 SecretChatStatePending |
 -- |
 -- 
 -- The secret chat is ready to use
 SecretChatStateReady |
 -- |
 -- 
 -- The secret chat is closed
 SecretChatStateClosed deriving (Eq)

instance Show SecretChatState where
 show SecretChatStatePending {  } =
  "SecretChatStatePending" ++ cc [ ]

 show SecretChatStateReady {  } =
  "SecretChatStateReady" ++ cc [ ]

 show SecretChatStateClosed {  } =
  "SecretChatStateClosed" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SecretChatState where
 toJSON SecretChatStatePending {  } =
  A.object [ "@type" A..= T.String "secretChatStatePending" ]

 toJSON SecretChatStateReady {  } =
  A.object [ "@type" A..= T.String "secretChatStateReady" ]

 toJSON SecretChatStateClosed {  } =
  A.object [ "@type" A..= T.String "secretChatStateClosed" ]

instance T.FromJSON SecretChatState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "secretChatStatePending" -> parseSecretChatStatePending v
   "secretChatStateReady" -> parseSecretChatStateReady v
   "secretChatStateClosed" -> parseSecretChatStateClosed v
   _ -> mempty
  where
   parseSecretChatStatePending :: A.Value -> T.Parser SecretChatState
   parseSecretChatStatePending = A.withObject "SecretChatStatePending" $ \o -> do
    return $ SecretChatStatePending {  }

   parseSecretChatStateReady :: A.Value -> T.Parser SecretChatState
   parseSecretChatStateReady = A.withObject "SecretChatStateReady" $ \o -> do
    return $ SecretChatStateReady {  }

   parseSecretChatStateClosed :: A.Value -> T.Parser SecretChatState
   parseSecretChatStateClosed = A.withObject "SecretChatStateClosed" $ \o -> do
    return $ SecretChatStateClosed {  }
 parseJSON _ = mempty
