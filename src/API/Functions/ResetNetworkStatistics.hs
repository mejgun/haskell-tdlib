-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetNetworkStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Resets all network data usage statistics to zero. Can be called before authorization
data ResetNetworkStatistics = 

 ResetNetworkStatistics deriving (Eq)

instance Show ResetNetworkStatistics where
 show ResetNetworkStatistics {  } =
  "ResetNetworkStatistics" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ResetNetworkStatistics where
 toJSON ResetNetworkStatistics {  } =
  A.object [ "@type" A..= T.String "resetNetworkStatistics" ]

instance T.FromJSON ResetNetworkStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resetNetworkStatistics" -> parseResetNetworkStatistics v
   _ -> mempty
  where
   parseResetNetworkStatistics :: A.Value -> T.Parser ResetNetworkStatistics
   parseResetNetworkStatistics = A.withObject "ResetNetworkStatistics" $ \o -> do
    return $ ResetNetworkStatistics {  }
 parseJSON _ = mempty
