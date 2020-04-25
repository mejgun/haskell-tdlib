-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SecretChatState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SecretChatState = 
 SecretChatStatePending 
 | SecretChatStateReady 
 | SecretChatStateClosed deriving (Show, Eq)

instance T.ToJSON SecretChatState where
 toJSON (SecretChatStatePending {  }) =
  A.object [ "@type" A..= T.String "secretChatStatePending" ]

 toJSON (SecretChatStateReady {  }) =
  A.object [ "@type" A..= T.String "secretChatStateReady" ]

 toJSON (SecretChatStateClosed {  }) =
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