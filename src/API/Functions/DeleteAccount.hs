-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteAccount where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account. Can be called before authorization when the current authorization state is authorizationStateWaitPassword 
-- 
-- __reason__ The reason why the account was deleted; optional
data DeleteAccount = 

 DeleteAccount { reason :: Maybe String }  deriving (Eq)

instance Show DeleteAccount where
 show DeleteAccount { reason=reason } =
  "DeleteAccount" ++ cc [p "reason" reason ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteAccount where
 toJSON DeleteAccount { reason = reason } =
  A.object [ "@type" A..= T.String "deleteAccount", "reason" A..= reason ]

instance T.FromJSON DeleteAccount where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteAccount" -> parseDeleteAccount v
   _ -> mempty
  where
   parseDeleteAccount :: A.Value -> T.Parser DeleteAccount
   parseDeleteAccount = A.withObject "DeleteAccount" $ \o -> do
    reason <- o A..:? "reason"
    return $ DeleteAccount { reason = reason }
 parseJSON _ = mempty
