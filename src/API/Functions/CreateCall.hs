-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol

--main = putStrLn "ok"

data CreateCall = 
 CreateCall { protocol :: CallProtocol.CallProtocol, user_id :: Int }  -- deriving (Show)

instance T.ToJSON CreateCall where
 toJSON (CreateCall { protocol = protocol, user_id = user_id }) =
  A.object [ "@type" A..= T.String "createCall", "protocol" A..= protocol, "user_id" A..= user_id ]
-- createCall CreateCall  { protocol :: CallProtocol.CallProtocol, user_id :: Int } 



instance T.FromJSON CreateCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createCall" -> parseCreateCall v
  where
   parseCreateCall :: A.Value -> T.Parser CreateCall
   parseCreateCall = A.withObject "CreateCall" $ \o -> do
    protocol <- o A..: "protocol"
    user_id <- o A..: "user_id"
    return $ CreateCall { protocol = protocol, user_id = user_id }