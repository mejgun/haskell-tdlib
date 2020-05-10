-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAlarm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Succeeds after a specified amount of time has passed. Can be called before authorization. Can be called before initialization 
-- 
-- __seconds__ Number of seconds before the function returns
data SetAlarm = 

 SetAlarm { seconds :: Maybe Float }  deriving (Show, Eq)

instance T.ToJSON SetAlarm where
 toJSON (SetAlarm { seconds = seconds }) =
  A.object [ "@type" A..= T.String "setAlarm", "seconds" A..= seconds ]

instance T.FromJSON SetAlarm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setAlarm" -> parseSetAlarm v
   _ -> mempty
  where
   parseSetAlarm :: A.Value -> T.Parser SetAlarm
   parseSetAlarm = A.withObject "SetAlarm" $ \o -> do
    seconds <- o A..:? "seconds"
    return $ SetAlarm { seconds = seconds }