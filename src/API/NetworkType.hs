-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NetworkType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Represents the type of a network
data NetworkType = 
 -- |
 -- 
 -- The network is not available
 NetworkTypeNone |
 -- |
 -- 
 -- A mobile network
 NetworkTypeMobile |
 -- |
 -- 
 -- A mobile roaming network
 NetworkTypeMobileRoaming |
 -- |
 -- 
 -- A Wi-Fi network
 NetworkTypeWiFi |
 -- |
 -- 
 -- A different network type (e.g., Ethernet network)
 NetworkTypeOther deriving (Eq)

instance Show NetworkType where
 show NetworkTypeNone {  } =
  "NetworkTypeNone" ++ cc [ ]

 show NetworkTypeMobile {  } =
  "NetworkTypeMobile" ++ cc [ ]

 show NetworkTypeMobileRoaming {  } =
  "NetworkTypeMobileRoaming" ++ cc [ ]

 show NetworkTypeWiFi {  } =
  "NetworkTypeWiFi" ++ cc [ ]

 show NetworkTypeOther {  } =
  "NetworkTypeOther" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON NetworkType where
 toJSON NetworkTypeNone {  } =
  A.object [ "@type" A..= T.String "networkTypeNone" ]

 toJSON NetworkTypeMobile {  } =
  A.object [ "@type" A..= T.String "networkTypeMobile" ]

 toJSON NetworkTypeMobileRoaming {  } =
  A.object [ "@type" A..= T.String "networkTypeMobileRoaming" ]

 toJSON NetworkTypeWiFi {  } =
  A.object [ "@type" A..= T.String "networkTypeWiFi" ]

 toJSON NetworkTypeOther {  } =
  A.object [ "@type" A..= T.String "networkTypeOther" ]

instance T.FromJSON NetworkType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "networkTypeNone" -> parseNetworkTypeNone v
   "networkTypeMobile" -> parseNetworkTypeMobile v
   "networkTypeMobileRoaming" -> parseNetworkTypeMobileRoaming v
   "networkTypeWiFi" -> parseNetworkTypeWiFi v
   "networkTypeOther" -> parseNetworkTypeOther v
   _ -> mempty
  where
   parseNetworkTypeNone :: A.Value -> T.Parser NetworkType
   parseNetworkTypeNone = A.withObject "NetworkTypeNone" $ \o -> do
    return $ NetworkTypeNone {  }

   parseNetworkTypeMobile :: A.Value -> T.Parser NetworkType
   parseNetworkTypeMobile = A.withObject "NetworkTypeMobile" $ \o -> do
    return $ NetworkTypeMobile {  }

   parseNetworkTypeMobileRoaming :: A.Value -> T.Parser NetworkType
   parseNetworkTypeMobileRoaming = A.withObject "NetworkTypeMobileRoaming" $ \o -> do
    return $ NetworkTypeMobileRoaming {  }

   parseNetworkTypeWiFi :: A.Value -> T.Parser NetworkType
   parseNetworkTypeWiFi = A.withObject "NetworkTypeWiFi" $ \o -> do
    return $ NetworkTypeWiFi {  }

   parseNetworkTypeOther :: A.Value -> T.Parser NetworkType
   parseNetworkTypeOther = A.withObject "NetworkTypeOther" $ \o -> do
    return $ NetworkTypeOther {  }
 parseJSON _ = mempty
