-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetActiveSessions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetActiveSessions = 
 GetActiveSessions -- deriving (Show)

instance T.ToJSON GetActiveSessions where
 toJSON (GetActiveSessions {  }) =
  A.object [ "@type" A..= T.String "getActiveSessions" ]
-- getActiveSessions GetActiveSessions 



instance T.FromJSON GetActiveSessions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getActiveSessions" -> parseGetActiveSessions v
  where
   parseGetActiveSessions :: A.Value -> T.Parser GetActiveSessions
   parseGetActiveSessions = A.withObject "GetActiveSessions" $ \o -> do
    return $ GetActiveSessions {  }