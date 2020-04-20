-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SecretChatState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SecretChatState = 
 SecretChatStatePending 
 | SecretChatStateReady 
 | SecretChatStateClosed -- deriving (Show)

instance T.ToJSON SecretChatState where
 toJSON (SecretChatStatePending {  }) =
  A.object [ "@type" A..= T.String "secretChatStatePending" ]

 toJSON (SecretChatStateReady {  }) =
  A.object [ "@type" A..= T.String "secretChatStateReady" ]

 toJSON (SecretChatStateClosed {  }) =
  A.object [ "@type" A..= T.String "secretChatStateClosed" ]
-- secretChatStatePending SecretChatState 

-- secretChatStateReady SecretChatState 

-- secretChatStateClosed SecretChatState 

