-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestPasswordRecovery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Requests to send a 2-step verification password recovery code to an email address that was previously set up
data RequestPasswordRecovery = 

 RequestPasswordRecovery deriving (Eq)

instance Show RequestPasswordRecovery where
 show RequestPasswordRecovery {  } =
  "RequestPasswordRecovery" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RequestPasswordRecovery where
 toJSON RequestPasswordRecovery {  } =
  A.object [ "@type" A..= T.String "requestPasswordRecovery" ]

instance T.FromJSON RequestPasswordRecovery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "requestPasswordRecovery" -> parseRequestPasswordRecovery v
   _ -> mempty
  where
   parseRequestPasswordRecovery :: A.Value -> T.Parser RequestPasswordRecovery
   parseRequestPasswordRecovery = A.withObject "RequestPasswordRecovery" $ \o -> do
    return $ RequestPasswordRecovery {  }
 parseJSON _ = mempty
