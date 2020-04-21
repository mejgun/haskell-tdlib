-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TerminateSession where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TerminateSession = 
 TerminateSession { session_id :: Int }  deriving (Show)

instance T.ToJSON TerminateSession where
 toJSON (TerminateSession { session_id = session_id }) =
  A.object [ "@type" A..= T.String "terminateSession", "session_id" A..= session_id ]



instance T.FromJSON TerminateSession where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "terminateSession" -> parseTerminateSession v

   _ -> mempty ""
  where
   parseTerminateSession :: A.Value -> T.Parser TerminateSession
   parseTerminateSession = A.withObject "TerminateSession" $ \o -> do
    session_id <- o A..: "session_id"
    return $ TerminateSession { session_id = session_id }