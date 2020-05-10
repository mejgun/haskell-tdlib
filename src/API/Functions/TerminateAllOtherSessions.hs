-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TerminateAllOtherSessions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Terminates all other sessions of the current user
data TerminateAllOtherSessions = 

 TerminateAllOtherSessions deriving (Show, Eq)

instance T.ToJSON TerminateAllOtherSessions where
 toJSON (TerminateAllOtherSessions {  }) =
  A.object [ "@type" A..= T.String "terminateAllOtherSessions" ]

instance T.FromJSON TerminateAllOtherSessions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "terminateAllOtherSessions" -> parseTerminateAllOtherSessions v
   _ -> mempty
  where
   parseTerminateAllOtherSessions :: A.Value -> T.Parser TerminateAllOtherSessions
   parseTerminateAllOtherSessions = A.withObject "TerminateAllOtherSessions" $ \o -> do
    return $ TerminateAllOtherSessions {  }